class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_by(user: current_user)
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:user_id])
    authorize @profile
    @profile.update(profile_params)
    redirect_to new_pregnancy_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :birthdate, :role)
  end
end
