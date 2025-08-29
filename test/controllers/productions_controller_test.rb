require "test_helper"

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productions_index_url
    assert_response :success
  end

  test "should get import" do
    get productions_import_url
    assert_response :success
  end
end
