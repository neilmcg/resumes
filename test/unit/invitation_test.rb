require File.dirname(__FILE__) + '/../test_helper'

class InvitationTest < ActiveSupport::TestCase

  test "can be created" do
    assert_difference "Invitation.count" do
      new_invitation.save!
    end
  end

end
