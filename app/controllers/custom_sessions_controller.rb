class CustomSessionsController < Devise::SessionsController
  after_action :after_login, only: :create

  def after_login
    flash[:success] = "Welcome back, #{current_user.name}!"
  end
end
