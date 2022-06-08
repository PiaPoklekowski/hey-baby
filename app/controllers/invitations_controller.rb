class InvitationsController < Devise::InvitationsController
  def after_invite_path_for(resource)
    new_important_contact_path
  end
end
