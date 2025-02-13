require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get players_search_url
    assert_response :success
  end
end
