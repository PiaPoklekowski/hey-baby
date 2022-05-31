class ProfilesController < ApplicationController
  ROLES = ["Mother", "Partner"]

  validates :role, inclusion: { in: ROLES }
end
