class AddImgUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :img_url, :string
  end
end
