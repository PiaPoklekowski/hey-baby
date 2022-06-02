class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tasks = policy_scope(Task)
    @tasks = Task.where(completed: false).and(Task.where(pregnancy: current_user.current_pregnancy))
    @important_contacts = ImportantContact.where(pregnancy: current_user.current_pregnancy)
  end
end
