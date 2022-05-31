class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(params[:profile])
    redirect_to profile_path(@profile)
  end
end
