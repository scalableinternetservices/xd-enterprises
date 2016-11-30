class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  #protect_from_forgery with: :exception

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless user_signed_in?
        store_location
        #flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
  
end
