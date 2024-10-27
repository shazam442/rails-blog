require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @post = posts(:first_post)
    @admin_user = users(:user_admin)
    sign_in @admin_user
  end
  
  test "should get index" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get posts" do
    get admin_posts_url
    assert_response :success
  end

  test "should get comments" do
    get admin_comments_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get show_post" do
    get admin_show_post_url(@post)
    assert_response :success
  end
end
