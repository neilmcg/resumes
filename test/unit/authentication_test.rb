require File.dirname(__FILE__) + '/../test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  def setup
    @quentin = users(:quentin)
  end
  
  test "should reset password" do
    @quentin.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal @quentin, User.authenticate('quentin', 'new password')
  end

  test "should not rehash password" do
    @quentin.update_attributes(:login => 'quentin2')
    assert_equal @quentin, User.authenticate('quentin2', 'monkey')
  end

  test "should authenticate user" do
    assert_equal @quentin, User.authenticate('quentin', 'monkey')
  end

  test "should set remember token" do
    @quentin.remember_me
    assert_not_nil @quentin.remember_token
    assert_not_nil @quentin.remember_token_expires_at
  end

  test "should unset remember token" do
    @quentin.remember_me
    assert_not_nil @quentin.remember_token
    @quentin.forget_me
    assert_nil @quentin.remember_token
  end

  test "should remember me for one week" do
    before = 1.week.from_now.utc
    @quentin.remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil @quentin.remember_token
    assert_not_nil @quentin.remember_token_expires_at
    assert @quentin.remember_token_expires_at.between?(before, after)
  end

  test "should remember me until one week" do
    time = 1.week.from_now.utc
    @quentin.remember_me_until time
    assert_not_nil @quentin.remember_token
    assert_not_nil @quentin.remember_token_expires_at
    assert_equal @quentin.remember_token_expires_at, time
  end

  test "should remember me default two weeks" do
    before = 2.weeks.from_now.utc
    @quentin.remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil @quentin.remember_token
    assert_not_nil @quentin.remember_token_expires_at
    assert @quentin.remember_token_expires_at.between?(before, after)
  end
end