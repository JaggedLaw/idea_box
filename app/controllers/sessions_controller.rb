class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(first_name: params[:session][:first_name])
      if @user && @user.authenticate(params[:session][:password])
       session[:user_id] = @user.id

       redirect_to user_ideas_path(@user)
      else
       flash.now[:errors] = "Invalid Login"
       render :new
      end
  end


  def destroy
    session.clear
    flash.now[:errors] = "You are logged out"
    redirect_to login_path
  end
end
