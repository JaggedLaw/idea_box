class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      #errors
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
  @category = Category.find(params[:id])
  @category.update(category_params)

  flash.notice = "Category '#{@category.name}' Updated!"

  redirect_to category_path(@category)
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to categories_path
  end


  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
