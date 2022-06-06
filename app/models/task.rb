class Task < ApplicationRecord
  belongs_to :category
  belongs_to :pregnancy

  validates :name, presence: true
  validates :description, presence: true
  # validates :completed, presence: true
  validates :assigned_to, presence: true
  validates :start_time, presence: true

  WEEKS = [[1, 4], [5, 8], [9, 13], [14, 17], [18, 22], [23, 27], [28, 31], [32, 35], [36, 40]]
end
