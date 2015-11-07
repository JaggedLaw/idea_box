class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @user = User.find params[:user_id]

  end
end
