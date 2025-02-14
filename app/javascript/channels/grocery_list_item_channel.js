import consumer from "./consumer"

consumer.subscriptions.create("GroceryListItemChannel", {
  received(data) {
    console.log(data);  // Check what data is being received

    if (data.deleted) {
      // Remove the grocery list item from the DOM
      const itemId = data.id;
      const itemElement = document.getElementById(itemId);
      if (itemElement) {
        itemElement.remove();
      }
    }

    // Handle other types of updates (e.g., status change) if necessary
  }
});