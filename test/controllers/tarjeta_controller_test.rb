require "test_helper"

class TarjetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarjetum = tarjeta(:one)
  end

  test "should get index" do
    get tarjeta_url
    assert_response :success
  end

  test "should get new" do
    get new_tarjetum_url
    assert_response :success
  end

  test "should create tarjetum" do
    assert_difference("Tarjetum.count") do
      post tarjeta_url, params: { tarjetum: { contras: @tarjetum.contras, fecha_ven: @tarjetum.fecha_ven, monto: @tarjetum.monto, nombre_titular: @tarjetum.nombre_titular, numero: @tarjetum.numero, user_id: @tarjetum.user_id } }
    end

    assert_redirected_to tarjetum_url(Tarjetum.last)
  end

  test "should show tarjetum" do
    get tarjetum_url(@tarjetum)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarjetum_url(@tarjetum)
    assert_response :success
  end

  test "should update tarjetum" do
    patch tarjetum_url(@tarjetum), params: { tarjetum: { contras: @tarjetum.contras, fecha_ven: @tarjetum.fecha_ven, monto: @tarjetum.monto, nombre_titular: @tarjetum.nombre_titular, numero: @tarjetum.numero, user_id: @tarjetum.user_id } }
    assert_redirected_to tarjetum_url(@tarjetum)
  end

  test "should destroy tarjetum" do
    assert_difference("Tarjetum.count", -1) do
      delete tarjetum_url(@tarjetum)
    end

    assert_redirected_to tarjeta_url
  end
end
