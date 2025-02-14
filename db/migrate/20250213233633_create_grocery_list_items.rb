class CreateGroceryListItems < ActiveRecord::Migration[8.0]
  def change
    create_table :grocery_list_items do |t|
      t.string :itemname
      t.boolean :status
      t.string :store
      t.integer :quantity

      t.timestamps
    end
  end
end
