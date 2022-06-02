class Profile < ApplicationRecord
  ROLES = ["Mother", "Partner"]

  validates :role, inclusion: { in: ROLES }

  belongs_to :user

  #geocoded_by :address
  #after_validation :geocode, if: :will_save_change_to_address?

end
