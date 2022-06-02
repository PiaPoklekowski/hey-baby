class DocumentsController < ApplicationController

  def index
    @documents = Document.all
    @documents = policy_scope(Document)
    authorize @category
  end
end
