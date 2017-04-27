class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitelisted_user_params)
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

  def whitelisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
