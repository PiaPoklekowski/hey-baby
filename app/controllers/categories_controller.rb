class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks.where(pregnancy: current_user.current_pregnancy)
    authorize @category
  end
end
