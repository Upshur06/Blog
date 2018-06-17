require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get content" do
    get comments_content_url
    assert_response :success
  end

end
