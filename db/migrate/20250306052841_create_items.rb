class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :errand, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :bought, default: false
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
