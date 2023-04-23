require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get searc" do
    get search_searc_url
    assert_response :success
  end
end
