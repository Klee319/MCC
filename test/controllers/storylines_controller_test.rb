require "test_helper"

class StorylinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get storylines_new_url
    assert_response :success
  end
end
