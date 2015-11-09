class IdeasController < ApplicationController

  def index
    @user = User.find session[:user_id]
    @ideas = @user.ideas
  end

  def new
    current_user
    @user = User.find session[:user_id]
    @idea = Idea.new
  end

  def create
    @user = User.find session[:user_id]
    @idea = @user.ideas.new(idea_params)
    @ideas = @user.ideas
    if @idea.save
      redirect_to user_ideas_path
    else
      #errors
    end
  end

  def show
    @user = User.find session[:user_id]
    @idea = @user.ideas.find(params[:user_id])
  end

  def edit
    @user = User.find session[:user_id]
    @idea = @user.ideas.find(params[:user_id])
  end

  def update
    @user = User.find session[:user_id]
    @idea = @user.ideas.find(params[:user_id])
    @idea.update(idea_params)

    flash.notice = "Idea '#{@idea.name}' Updated!"

    redirect_to user_idea_path
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to user_ideas_path
  end


  private
  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end
