class UsersController < ApplicationController
  #fix hierarchy so that ideas controller is showing index of ideas, not user controller
  require 'bcrypt'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to user_ideas_path(@user)
    else
      #flash errors
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password)
  end
end
