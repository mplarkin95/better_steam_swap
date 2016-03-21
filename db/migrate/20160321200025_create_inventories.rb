class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :items, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true
      t.integer :quantity
      t.boolean :paypal

      t.timestamps null: false
    end
  end
end
