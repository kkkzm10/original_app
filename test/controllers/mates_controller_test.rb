require 'test_helper'

class MatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mates_index_url
    assert_response :success
  end

end
