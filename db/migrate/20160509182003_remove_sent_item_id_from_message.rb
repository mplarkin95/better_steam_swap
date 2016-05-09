class RemoveSentItemIdFromMessage < ActiveRecord::Migration
  def change
  	remove_column :messages, :sent_item_id
  end
end
