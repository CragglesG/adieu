require "test_helper"

class AdsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login" do
    get ads_url
    assert_response :redirect
  end
end
