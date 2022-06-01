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
      redirect_to new_important_contact_path(@pregnancy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pregnancy_params
    params.require(:pregnancy).permit(:pregnancy_week, :due_date, :baby_nickname, :gender)
  end
end
