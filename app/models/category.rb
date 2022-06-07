class Category < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
