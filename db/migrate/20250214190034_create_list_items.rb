class CreateListItems < ActiveRecord::Migration[8.0]
  def change
    create_table :list_items do |t|
      t.string :name
      t.integer :qty
      t.boolean :status
      t.string :store

      t.timestamps
    end
  end
end
