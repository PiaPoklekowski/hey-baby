class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tasks = policy_scope(Task)
    @tasks = Task.where(completed: false)
  end


end
