require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 51;
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "emails should be accepted" do
    valids = %w[user@example.com USER@foo.com A_USER-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valids.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{@user.email} should be valid"
    end
  end
  
  test "emails should be rejected" do
    invalids = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalids.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{@user.email} should be invalid"
    end
  end
  
  test "emails should be unique" do
    @user.save
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
  end
  
end
