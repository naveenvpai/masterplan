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
  
  test "emails should be valid" do
    valids = %w[user@example.com USER@foo.com A_USER-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valids.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{@user.email} should be valid"
    end
  end
  
end
