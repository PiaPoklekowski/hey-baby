class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task)
  end

  def show
    # @task = Task.where(pregnancy: current_user.current_pregnancy).and(Task.find(params[:category_id]))
    # authorize @task
  end
end
