require "test_helper"

class GroceryListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grocery_list_item = grocery_list_items(:one)
  end

  test "should get index" do
    get grocery_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_grocery_list_item_url
    assert_response :success
  end

  test "should create grocery_list_item" do
    assert_difference("GroceryListItem.count") do
      post grocery_list_items_url, params: { grocery_list_item: { itemname: @grocery_list_item.itemname, quantity: @grocery_list_item.quantity, status: @grocery_list_item.status, store: @grocery_list_item.store } }
    end

    assert_redirected_to grocery_list_item_url(GroceryListItem.last)
  end

  test "should show grocery_list_item" do
    get grocery_list_item_url(@grocery_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_grocery_list_item_url(@grocery_list_item)
    assert_response :success
  end

  test "should update grocery_list_item" do
    patch grocery_list_item_url(@grocery_list_item), params: { grocery_list_item: { itemname: @grocery_list_item.itemname, quantity: @grocery_list_item.quantity, status: @grocery_list_item.status, store: @grocery_list_item.store } }
    assert_redirected_to grocery_list_item_url(@grocery_list_item)
  end

  test "should destroy grocery_list_item" do
    assert_difference("GroceryListItem.count", -1) do
      delete grocery_list_item_url(@grocery_list_item)
    end

    assert_redirected_to grocery_list_items_url
  end
end
