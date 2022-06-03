class DocumentsController < ApplicationController
  def index
    @categories = policy_scope(Category)
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:category_id])
    @documents = Document.where(category: params[:category_id])
    authorize @documents
  end
end
