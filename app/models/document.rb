class Document < ApplicationRecord
  belongs_to :category
  belongs_to :pregnancy
end
