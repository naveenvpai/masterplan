require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = User.new(name:"Bob", email:"bobthebuilder@gmail.com")
    @invalid_user = User.new(name:"Rob", email:"robthedestroyer@gmail")
  end
  
  test "should be valid" do 
    assert @valid_user.valid?
  end
  
  test "should be invalid" do
    assert !@invalid_user.valid?
  end
end
