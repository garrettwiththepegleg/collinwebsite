require "test_helper"

class MechanicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mechanic_index_url
    assert_response :success
  end
end
