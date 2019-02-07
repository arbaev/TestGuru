class CustomSessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = t('.welcome', name: current_user.name)
  end
end
