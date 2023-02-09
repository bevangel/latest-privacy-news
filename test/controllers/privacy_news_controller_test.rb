require "test_helper"

class PrivacyNewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get privacy_news_index_url
    assert_response :success
  end
end
