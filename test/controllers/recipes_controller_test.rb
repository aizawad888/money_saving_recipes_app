require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get recipes_search_url
    assert_response :success
  end
end
