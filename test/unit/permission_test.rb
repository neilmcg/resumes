require File.dirname(__FILE__) + '/../test_helper'

class PermissionTest < ActiveSupport::TestCase
  test "can be created" do
    assert_difference 'Permission.count' do
      new_permission.save!
    end
  end
  
  context "with validations" do
    test "requires an owner" do
      permission = new_permission(:owner => nil)
      assert ! permission.valid?
      assert permission.errors.on(:owner)
    end
    
    test "requires a recruiter" do
      permission = new_permission(:recruiter => nil)
      assert ! permission.valid?
      assert permission.errors.on(:recruiter)
    end
  end
end
