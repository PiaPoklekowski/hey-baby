class Pregnancy < ApplicationRecord
  belongs_to :mother, class_name: "User"
  belongs_to :partner, class_name: "User", optional: true
end
