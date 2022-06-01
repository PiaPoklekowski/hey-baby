class Profile < ApplicationRecord
  ROLES = ["Mother", "Partner"]

  validates :role, inclusion: { in: ROLES }

  belongs_to :user


end
