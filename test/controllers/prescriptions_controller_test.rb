require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prescriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get prescriptions_show_url
    assert_response :success
  end

  test "should get edit" do
    get prescriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get prescriptions_update_url
    assert_response :success
  end
end
