class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_ideas_path(@user)
    else
      #flash errors
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
