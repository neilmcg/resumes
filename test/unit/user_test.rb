require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
    assert_difference 'User.count' do
      create_user
    end
  end
  
  context "testing validations" do
    test "should require login" do
      user = new_user(:login => nil)
      assert ! user.valid?
      assert user.errors.on(:login)
    end

    test "should require password" do
      user = new_user(:password => nil)
      assert ! user.valid?
      assert user.errors.on(:password)
    end

    test "should require password confirmation" do
      user = new_user(:password_confirmation => nil)
      assert ! user.valid?
      assert user.errors.on(:password_confirmation)
    end

    test "should require email" do
      user = new_user(:email => nil)
      assert ! user.valid?
      assert user.errors.on(:email)
    end
  end
end
