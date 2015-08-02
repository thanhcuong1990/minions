class ApiController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :authenticate_user!
  rescue_from Exception, :with => :response_error_unknown

  include Authenticable

  # API methods
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

  def response_success_with_data(data)
    @response = {:success => true, data: data.as_json}
    send_response
  end

  def response_success_with_message(message)
    @response = {:success => true, message: message}
    send_response
  end

  def response_error(message, error_code)
    @response = {:success => false, :status => error_code, message: message}
    send_response
  end

  def has_error?
    @response && @response[:success] == false
  end

  def response_error_unknown
    response_error("Unknown error", 1007)
  end

  # Check params validation
  def validate_params(type, prms = params)

    if prms && (!prms[:per_page])
      prms.delete :format
      prms.delete :action
      prms.delete :subdomain
      prms.delete :controller

      prms.each do |parkey, v|
        unless ALLOWED_PARAMS[type].include? parkey
          response_error("Params not valid", 1008)
          return
        end
      end
    else
      response_error("Params not valid", 1008)
    end
  end
end