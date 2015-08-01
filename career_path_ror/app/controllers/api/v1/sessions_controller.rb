class Api::V1::SessionsController < ApiController
  skip_before_action :authenticate_with_token!, :only => [:create]

  # Login API
  def create
    name = params[:name]
    email = params[:email]

    unless email.nil?
      user = User.find_by(email: email)
      if user.nil?
        user = User.create(email: email, name: name, password: name+email)
      end
      user.name = name
      user.generate_authentication_token!
      user.save

      response_sucess(user)
    else
      response_error("Email not valid", 401)
    end
  end

  # Logout API
  def destroy
    response_success_with_message("Logout success.")
  end

end
