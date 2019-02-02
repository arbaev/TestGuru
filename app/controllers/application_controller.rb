class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :user_admin?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end

  def user_admin?
    current_user.is_a?(Admin) if user_signed_in?
  end
end
