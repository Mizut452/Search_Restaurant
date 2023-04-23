require "test_helper"

class KensakuControllerTest < ActionDispatch::IntegrationTest
  test "should get kensaku" do
    get kensaku_kensaku_url
    assert_response :success
  end
end
