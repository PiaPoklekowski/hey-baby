class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @tasks = policy_scope(Task)
    @tasks = Task.order(:deadline).and(Task.where(completed: false).and(Task.where(pregnancy: current_user.current_pregnancy)))
    @important_contacts = ImportantContact.where(pregnancy: current_user.current_pregnancy)
  end
end
