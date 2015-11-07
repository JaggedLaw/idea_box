class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @user = User.find params[:user_id]

  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      #errors
    end
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
