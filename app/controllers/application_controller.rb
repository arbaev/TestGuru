class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :expire_hsts

  def default_url_options
    {lang: (I18n.locale unless I18n.locale == I18n.default_locale)}
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
