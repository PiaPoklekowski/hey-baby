class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    profile = current_user.profile
    if @task.name == "Find a hospital" && profile.geocoded?
      @user_marker =
        {
          lat: profile.latitude,
          lng: profile.longitude,
          info_window: render_to_string(partial: "info_window_profile", locals: { profile: profile })
        }
      @markers = Hospital.all.geocoded.map do |hospital|
        {
          lat: hospital.latitude,
          lng: hospital.longitude,
          info_window: render_to_string(partial: "info_window", locals: { hospital: hospital })
        }
      end
      @all_markers = @markers.push(@user_marker)
    end
  end
end
