require 'date'

class PregnanciesController < ApplicationController

  def new
    @pregnancy = Pregnancy.new
    authorize @pregnancy
  end

  def create
    @pregnancy = Pregnancy.new(pregnancy_params)
    @pregnancy.mother = current_user
    authorize @pregnancy
    if @pregnancy.save
      # respond_to do |format|
      #   format.html { redirect_to new_important_contact_path }
      redirect_to new_important_contact_path
      # end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pregnancy_params
    params.require(:pregnancy).permit(:due_date, :baby_nickname, :gender)
  end
end
