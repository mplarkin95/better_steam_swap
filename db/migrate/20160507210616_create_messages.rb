class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :sent_item_id
      t.integer :rec_item_id
      t.boolean :trade


      t.timestamps null: false
    end
  end
end
