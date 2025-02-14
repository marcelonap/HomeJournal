class DeleteGroceryListItemJob < ApplicationJob
  queue_as :default

  def perform(grocery_list_item_id)
    grocery_list_item = GroceryListItem.find_by(id: grocery_list_item_id)
    if grocery_list_item
      grocery_list_item.destroy
      # Broadcast the deletion
      GroceryListItemChannel.broadcast_to(grocery_list_item, { deleted: true })
    end
  end
end