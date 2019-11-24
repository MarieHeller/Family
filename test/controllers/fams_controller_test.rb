require 'test_helper'

class FamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fams_index_url
    assert_response :success
  end

  test "should get show" do
    get fams_show_url
    assert_response :success
  end

  test "should get new" do
    get fams_new_url
    assert_response :success
  end

  test "should get create" do
    get fams_create_url
    assert_response :success
  end

  test "should get destroy" do
    get fams_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get fams_edit_url
    assert_response :success
  end

  test "should get update" do
    get fams_update_url
    assert_response :success
  end

end
