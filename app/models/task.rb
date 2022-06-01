class Task < ApplicationRecord
  belongs_to :category
  belongs_to :pregnancy

  validates :name, presence: true
  validates :description, presence: true
  # validates :completed, presence: true
  validates :assigned_to, presence: true
  validates :start_time, presence: true

end
