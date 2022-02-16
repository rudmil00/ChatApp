require "test_helper"

class SesijaControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sesija_login_url
    assert_response :success
  end
end
