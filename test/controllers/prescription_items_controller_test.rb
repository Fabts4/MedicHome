require "test_helper"

class PrescriptionItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get prescription_items_create_url
    assert_response :success
  end

  test "should get update" do
    get prescription_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prescription_items_destroy_url
    assert_response :success
  end
end
