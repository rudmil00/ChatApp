require "test_helper"

class ChatsobaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatsoba_index_url
    assert_response :success
  end
end
