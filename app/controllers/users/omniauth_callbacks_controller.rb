class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:google_oauth2]
  #Handle Callback after redirection from google
  def google_oauth2
    if user_signed_in?
      connect_with_google
    else
      register_user_google
    end
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  #This function connects the user with the google
  def connect_with_google
    if current_user.email == auth.info.email
      User.update_user_credentials(current_user, auth)
      redirect_to root_path, notice: "User is connected with google"
    else
      redirect_to root_path, alert: "Use your registered Labsmart email for google login"
    end
  end

  #This function redirects the user to registration page if the user is not registered but tries accessing with google
  def register_user_google
    user = User.from_omniauth(auth)
    if user.present?
      flash[:success] = t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect user, event: :authentication
    else
      redirect_to root_path, alert: "User does not exist"
    end
  end
end
