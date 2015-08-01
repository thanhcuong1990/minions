module Authenticable

  # Devise methods overwrites
  def current_user
    user_device = request.headers['Device'].presence
    @current_user = user_device && User.find_by(device_id: user_device)

    if @current_user && Devise.secure_compare(@current_user.auth_token, request.headers['Authorization'])
      if @current_user.timedout?(@current_user.current_sign_in_at)
        return
      else
        User.set_user_sign_in(@current_user)
        return @current_user
      end
    end
  end

  def authenticate_with_token!
    response_error('Unauthorized', 401) unless current_user.present?
  end

  def user_signed_in?
    @current_user.present?
  end

end