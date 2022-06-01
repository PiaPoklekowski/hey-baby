class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end
end
