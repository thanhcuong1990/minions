module Authenticable

  # Devise methods overwrites
  def current_user
    user_email = request.headers['Auth-Email'].presence
    @current_user = user_email && User.find_by(email: user_email)

    if @current_user && Devise.secure_compare(@current_user.auth_token, request.headers['Auth-Token'])
        User.set_user_sign_in(@current_user)
        return @current_user
    end
  end

  def authenticate_with_token!
    response_error('Unauthorized', 401) unless current_user.present?
  end

  def user_signed_in?
    @current_user.present?
  end

end