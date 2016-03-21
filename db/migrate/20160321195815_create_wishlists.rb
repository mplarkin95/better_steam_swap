class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :items, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
