class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return_to) || tests_path
    else
      flash.now[:alert] = 'Verify your email and password, please.'
      render :new
    end
  end

  def destroy
    session.clear
    cookies.clear
    @current_user = nil
    redirect_to root_path, notice: 'Goodbye!'
  end
end
