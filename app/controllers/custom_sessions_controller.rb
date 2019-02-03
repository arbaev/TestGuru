class CustomSessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = "Welcome back, #{current_user.name}!"
  end
end
