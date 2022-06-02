class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    if @task.name == "Find a hospital"
      @user_marker = [current_user.profile].geocoded.map { |address| {lat: address.latitude, lng: address.longitude } }
      @markers = Hospital.all.geocoded.map do |hospital|
        {
          lat: hospital.latitude,
          lng: hospital.longitude
        }
      end
    end
  end
end
