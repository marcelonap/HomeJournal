class GroceryListItemChannel < ApplicationCable::Channel
  def subscribed
    # Stream from a specific grocery list item
    stream_for grocery_list_item
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
