class Document < ApplicationRecord
  has_many_attached :photos
  belongs_to :category
  belongs_to :pregnancy

end
