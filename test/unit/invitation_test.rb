require File.dirname(__FILE__) + '/../test_helper'

class InvitationTest < ActiveSupport::TestCase

  test "can be created" do
    assert_difference "Invitation.count" do
      new_invitation.save!
    end
  end
  
  test "a recruiter can request access to view a private profile" do
    @invitation = create_invitation
    assert @invitation.request_access(:invitee_id => 1)
  end

end
