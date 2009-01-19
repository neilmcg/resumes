class Invitation < ActiveRecord::Base
  belongs_to :user
  
  def request_access(invitee_id)
    true
  end
  
end
