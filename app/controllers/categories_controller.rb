class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.all
  end
end
