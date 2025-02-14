json.extract! grocery_list_item, :id, :itemname, :status, :store, :quantity, :created_at, :updated_at
json.url grocery_list_item_url(grocery_list_item, format: :json)
