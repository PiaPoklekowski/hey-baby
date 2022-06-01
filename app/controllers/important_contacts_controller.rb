class ImportantContactsController < ApplicationController
  def new
    @pregnancy = current_user.current_pregnancy
    @important_contact = ImportantContact.new
    authorize @important_contact
  end

  def create
    @important_contact = ImportantContact.new(important_contact_params)
    @important_contact.pregnancy = current_user.current_pregnancy
    authorize @important_contact
    if @important_contact.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def important_contact_params
    params.require(:important_contact).permit(:name, :address, :phone_number, :email)
  end
end
