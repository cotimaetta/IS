require "application_system_test_case"

class TarjetaTest < ApplicationSystemTestCase
  setup do
    @tarjetum = tarjeta(:one)
  end

  test "visiting the index" do
    visit tarjeta_url
    assert_selector "h1", text: "Tarjeta"
  end

  test "should create tarjetum" do
    visit tarjeta_url
    click_on "New tarjetum"

    fill_in "Contras", with: @tarjetum.contras
    fill_in "Fecha ven", with: @tarjetum.fecha_ven
    fill_in "Monto", with: @tarjetum.monto
    fill_in "Nombre titular", with: @tarjetum.nombre_titular
    fill_in "Numero", with: @tarjetum.numero
    fill_in "User", with: @tarjetum.user_id
    click_on "Create Tarjetum"

    assert_text "Tarjetum was successfully created"
    click_on "Back"
  end

  test "should update Tarjetum" do
    visit tarjetum_url(@tarjetum)
    click_on "Edit this tarjetum", match: :first

    fill_in "Contras", with: @tarjetum.contras
    fill_in "Fecha ven", with: @tarjetum.fecha_ven
    fill_in "Monto", with: @tarjetum.monto
    fill_in "Nombre titular", with: @tarjetum.nombre_titular
    fill_in "Numero", with: @tarjetum.numero
    fill_in "User", with: @tarjetum.user_id
    click_on "Update Tarjetum"

    assert_text "Tarjetum was successfully updated"
    click_on "Back"
  end

  test "should destroy Tarjetum" do
    visit tarjetum_url(@tarjetum)
    click_on "Destroy this tarjetum", match: :first

    assert_text "Tarjetum was successfully destroyed"
  end
end
