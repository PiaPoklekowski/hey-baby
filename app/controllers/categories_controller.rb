class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.joins(:tasks).order(start_time: :asc).uniq
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks.where(pregnancy: current_user.current_pregnancy)
    authorize @category
  end
end
