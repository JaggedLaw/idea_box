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
    @idea = Idea.new(idea_params)
    @user = User.find session[:user_id]
    if @idea.save
      redirect_to user_ideas_path
    else
      #errors
    end
    @ideas = @user.ideas
      binding.pry
  end

  def show
    @idea = Idea.find(params[:id])

  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
  @idea = Idea.find(params[:id])
  @idea.update(idea_params)

  flash.notice = "Idea '#{@idea.name}' Updated!"

  redirect_to idea_path(@idea)
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
