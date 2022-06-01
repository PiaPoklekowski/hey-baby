class Category < ApplicationRecord
  has_many :documents
  has_many :tasks, dependent: :destroy
end
