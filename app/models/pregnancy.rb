class Pregnancy < ApplicationRecord
  belongs_to :mother_id
  belongs_to :partner_id
end
