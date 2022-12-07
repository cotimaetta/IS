require "test_helper"

class MultaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multum = multa(:one)
  end

  test "should get index" do
    get multa_index_url
    assert_response :success
  end

  test "should get new" do
    get new_multum_url
    assert_response :success
  end

  test "should create multum" do
    assert_difference("Multa.count") do
      post multa_index_url, params: { multum: { descripcion: @multum.descripcion, historialuso: @multum.historialuso, monto: @multum.monto, references: @multum.references, user_id: @multum.user_id } }
    end

    assert_redirected_to multum_url(Multa.last)
  end

  test "should show multum" do
    get multum_url(@multum)
    assert_response :success
  end

  test "should get edit" do
    get edit_multum_url(@multum)
    assert_response :success
  end

  test "should update multum" do
    patch multum_url(@multum), params: { multum: { descripcion: @multum.descripcion, historialuso: @multum.historialuso, monto: @multum.monto, references: @multum.references, user_id: @multum.user_id } }
    assert_redirected_to multum_url(@multum)
  end

  test "should destroy multum" do
    assert_difference("Multa.count", -1) do
      delete multum_url(@multum)
    end

    assert_redirected_to multa_index_url
  end
end
