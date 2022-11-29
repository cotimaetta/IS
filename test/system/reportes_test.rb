require "application_system_test_case"

class ReportesTest < ApplicationSystemTestCase
  setup do
    @reporte = reportes(:one)
  end

  test "visiting the index" do
    visit reportes_url
    assert_selector "h1", text: "Reportes"
  end

  test "should create reporte" do
    visit reportes_url
    click_on "New reporte"

    fill_in "Auto", with: @reporte.auto_id
    fill_in "Descripcion", with: @reporte.descripcion
    fill_in "Fecha", with: @reporte.fecha
    click_on "Create Reporte"

    assert_text "Reporte was successfully created"
    click_on "Back"
  end

  test "should update Reporte" do
    visit reporte_url(@reporte)
    click_on "Edit this reporte", match: :first

    fill_in "Auto", with: @reporte.auto_id
    fill_in "Descripcion", with: @reporte.descripcion
    fill_in "Fecha", with: @reporte.fecha
    click_on "Update Reporte"

    assert_text "Reporte was successfully updated"
    click_on "Back"
  end

  test "should destroy Reporte" do
    visit reporte_url(@reporte)
    click_on "Destroy this reporte", match: :first

    assert_text "Reporte was successfully destroyed"
  end
end
