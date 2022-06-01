class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find_by(user: current_user)
    authorize @profile
  end

  def update
    @profile = Profile.find_by(user: current_user)
    authorize @profile
    @profile.update(profile_params)
    if @profile.role == "Mother"
      redirect_to new_pregnancy_path
    else
      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :birthdate, :role)
  end
end
