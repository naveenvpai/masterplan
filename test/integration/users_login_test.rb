require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: "", password: "" } }
    assert_not flash.empty?
    puts flash[:danger]
    get root_path
    assert flash.empty?
  end
end
