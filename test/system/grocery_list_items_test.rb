require "application_system_test_case"

class GroceryListItemsTest < ApplicationSystemTestCase
  setup do
    @grocery_list_item = grocery_list_items(:one)
  end

  test "visiting the index" do
    visit grocery_list_items_url
    assert_selector "h1", text: "Grocery list items"
  end

  test "should create grocery list item" do
    visit grocery_list_items_url
    click_on "New grocery list item"

    fill_in "Itemname", with: @grocery_list_item.itemname
    fill_in "Quantity", with: @grocery_list_item.quantity
    check "Status" if @grocery_list_item.status
    fill_in "Store", with: @grocery_list_item.store
    click_on "Create Grocery list item"

    assert_text "Grocery list item was successfully created"
    click_on "Back"
  end

  test "should update Grocery list item" do
    visit grocery_list_item_url(@grocery_list_item)
    click_on "Edit this grocery list item", match: :first

    fill_in "Itemname", with: @grocery_list_item.itemname
    fill_in "Quantity", with: @grocery_list_item.quantity
    check "Status" if @grocery_list_item.status
    fill_in "Store", with: @grocery_list_item.store
    click_on "Update Grocery list item"

    assert_text "Grocery list item was successfully updated"
    click_on "Back"
  end

  test "should destroy Grocery list item" do
    visit grocery_list_item_url(@grocery_list_item)
    click_on "Destroy this grocery list item", match: :first

    assert_text "Grocery list item was successfully destroyed"
  end
end
