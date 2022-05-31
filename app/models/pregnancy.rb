class Pregnancy < ApplicationRecord
  belongs_to :mother, class_name: "User"
  belongs_to :partner, class_name: "User", optional: true
  has_many :tasks
  has_many :documents
  has_many :categories, through: :tasks

  validates :due_date, presence: true
  validates :pregnancy_week, presence: true
end
