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

  def new
    @category = Category.find(params[:category_id])
    @document = Document.new
  end

  def create
    @category = Category.find(params[:category_id])
    @document = Document.new(document_params)
    @document.pregnancy = current_user.pregnancies_as_mother.last
    @document.category = @category
    if @document.save
      redirect_to category_documents_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def document_params
    params.require(:document).permit(:name, photos: [])
  end
end
