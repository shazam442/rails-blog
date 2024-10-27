require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get user_url(users(:user_sam))
    assert_response :success
  end
end
