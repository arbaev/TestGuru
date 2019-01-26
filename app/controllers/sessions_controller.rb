class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Verify your email and password, please.'
      render :new
    end
  end

  def destroy
    session.clear
    @current_user = nil
    redirect_to login_path, notice: 'Goodbye!'
  end
end
