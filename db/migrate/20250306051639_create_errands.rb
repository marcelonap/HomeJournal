class CreateErrands < ActiveRecord::Migration[8.0]
  def change
    create_table :errands do |t|
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
