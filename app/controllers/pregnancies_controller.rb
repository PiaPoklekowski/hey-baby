class PregnanciesController < ApplicationController

  def new
    @pregnancy = Pregnancy.new
  end

  def create
    @pregnancy = Pregnancy.new(pregnancy_params)
    @pregnancy.mother = current_user
  end

  private

  def pregnancy_params
    params.require(:pregnancy).permit(:pregnancy_week, :due_date, :baby_nickname, :gender, :partner)
  end
end
