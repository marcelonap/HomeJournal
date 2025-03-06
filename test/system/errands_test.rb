require "application_system_test_case"

class ErrandsTest < ApplicationSystemTestCase
  setup do
    @errand = errands(:one)
  end

  test "visiting the index" do
    visit errands_url
    assert_selector "h1", text: "Errands"
  end

  test "should create errand" do
    visit errands_url
    click_on "New errand"

    fill_in "Category", with: @errand.category
    fill_in "Location", with: @errand.location
    click_on "Create Errand"

    assert_text "Errand was successfully created"
    click_on "Back"
  end

  test "should update Errand" do
    visit errand_url(@errand)
    click_on "Edit this errand", match: :first

    fill_in "Category", with: @errand.category
    fill_in "Location", with: @errand.location
    click_on "Update Errand"

    assert_text "Errand was successfully updated"
    click_on "Back"
  end

  test "should destroy Errand" do
    visit errand_url(@errand)
    click_on "Destroy this errand", match: :first

    assert_text "Errand was successfully destroyed"
  end
end
