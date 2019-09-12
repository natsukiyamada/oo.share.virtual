require 'test_helper'

class UnknownUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get unknown_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get unknown_users_destroy_url
    assert_response :success
  end

end
