class ImportantContact < ApplicationRecord
  belongs_to :pregnancy

  validates :phone_number, presence: true
  validates :name, presence: true
end
