class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  include Authenticable

  def send_response
    render json: @response
  end

  def response_sucess(object, name_model = nil)
    data_json = nil
    if object.respond_to?(:to_ary)
      if !name_model
        name_model = object.name.pluralize.downcase
      end
      data_json = {name_model => ActiveModel::ArraySerializer.new(object, scope: serialization_scope).as_json}
    else
      data_json = ActiveModel::Serializer.serializer_for(object).new(object, scope: serialization_scope).as_json
    end
    @response = {:success => true, :data => data_json}
    send_response
  end

  def response_error(message, error_code)
    @response = {:success => false, :status => error_code, message: message}
    send_response
  end

  def has_error?
    @response && @response[:success] == false
  end

  def validate_params(type, prms = params)

    if prms && (!prms[:per_page] ||prms[:per_page].to_i  <= Setting.i(:max_per_page_default))
      prms.delete :format
      prms.delete :action
      prms.delete :subdomain
      prms.delete :controller

      prms.each do |parkey, v|
        unless ALLOWED_PARAMS[type].include? parkey
          response_error('params not valid', 400)
          return
        end
      end
    else
      response_error('params not valid', 400)
    end
  end

  def force_using_https!
    response_error('Forbidden', 403) unless request.ssl?
  end
end
