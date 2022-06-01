class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.all
    @tasks = Task.find(params[:category_id])
  end
end
