class ImportantContactsController < ApplicationController
  def new
    @pregnancy = current_user.current_pregnancy
    @important_contact = ImportantContact.new
    authorize @important_contact
  end

  def create
  end
end
