class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
