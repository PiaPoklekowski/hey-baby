class Pregnancy < ApplicationRecord
  GENDERS = ["Girl", "Boy", "Undefined"]

  belongs_to :mother, class_name: "User"
  belongs_to :partner, class_name: "User", optional: true
  has_many :tasks
  has_many :documents
  has_many :categories, through: :tasks
  has_many :important_contacts, dependent: :destroy

  validates :gender, inclusion: { in: GENDERS }
  validates :due_date, presence: true

  def week_of_pregnancy
    conception_date = self.due_date - 280
    week_of_pregancy = ((Date.today - conception_date) / 7.0).round()
  end
end
