class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render :json => @categories
  end

  def show
    category = Category.find(params[:id])
    render :json => category
  end

  def create
    category = Category.create(category_params)
    render :json => category
  end

  def update
    category = Category.find(params[:id])
    if category.update_attributes(category_params)
      render :json => {status: :success}
    else
      render :json => {status: :update_failed}
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      render :json => {status: :success}
    else
      render :json => {status: :delete_failed}
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end


end
