require "test_helper"

class AlquileresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alquileres_index_url
    assert_response :success
  end

  test "should get show" do
    get alquileres_show_url
    assert_response :success
  end

  test "should get new" do
    get alquileres_new_url
    assert_response :success
  end

  test "should get create" do
    get alquileres_create_url
    assert_response :success
  end
end
