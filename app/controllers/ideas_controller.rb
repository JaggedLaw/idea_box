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
    @idea = Idea.find(params[:id])
  end

  def update
  @idea = Idea.find(params[:id])
  @idea.update(idea_params)

  flash.notice = "Idea '#{@idea.name}' Updated!"

  redirect_to user_idea_path(@idea)
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to ideas_path
  end


  private
  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end
