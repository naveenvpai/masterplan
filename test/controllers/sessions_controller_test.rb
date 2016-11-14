require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end
  
  test "stays logged in" do
    get login_path
    post login_path, params: { session: { email:users(:michael).email, password:"password" } }
    assert_redirected_to users(:michael)
    get root_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
  end
end
