require "application_system_test_case"

class MultaTest < ApplicationSystemTestCase
  setup do
    @multum = multa(:one)
  end

  test "visiting the index" do
    visit multa_url
    assert_selector "h1", text: "Multa"
  end

  test "should create multa" do
    visit multa_url
    click_on "New multa"

    fill_in "Descripcion", with: @multum.descripcion
    fill_in "Historialuso", with: @multum.historialuso
    fill_in "Monto", with: @multum.monto
    fill_in "References", with: @multum.references
    fill_in "User", with: @multum.user_id
    click_on "Create Multa"

    assert_text "Multa was successfully created"
    click_on "Back"
  end

  test "should update Multa" do
    visit multum_url(@multum)
    click_on "Edit this multa", match: :first

    fill_in "Descripcion", with: @multum.descripcion
    fill_in "Historialuso", with: @multum.historialuso
    fill_in "Monto", with: @multum.monto
    fill_in "References", with: @multum.references
    fill_in "User", with: @multum.user_id
    click_on "Update Multa"

    assert_text "Multa was successfully updated"
    click_on "Back"
  end

  test "should destroy Multa" do
    visit multum_url(@multum)
    click_on "Destroy this multa", match: :first

    assert_text "Multa was successfully destroyed"
  end
end
