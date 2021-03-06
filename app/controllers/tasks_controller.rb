class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    @category = Category.find(@task.category.id)
    profile = current_user.profile
    if @task.name == "Find a hospital and book an appointment" && profile.geocoded?
      @user_marker =
        {
          lat: profile.latitude,
          lng: profile.longitude,
          info_window: render_to_string(partial: "info_window_profile", locals: { profile: profile }),
          image_url: helpers.asset_url("Pin_Home.png")
        }
      @markers = Hospital.all.geocoded.map do |hospital|
        {
          lat: hospital.latitude,
          lng: hospital.longitude,
          # info_window: render_to_string(partial: "info_window", locals: { hospital: hospital }),
          image_url: helpers.asset_url("Pin_Hospital.png"),
          hospital_id: hospital.id
        }
      end
      @all_markers = @markers.push(@user_marker)
    end
  end

  def index
    @tasks = policy_scope(Task)
    @tasks = Task.order(:start_time).and(Task.where(pregnancy: current_user.current_pregnancy))
    @weeks = Task::WEEKS
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def task_params
    params.require(:task).permit(:completed)
  end
end
