class AddSteamUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :steam_url, :string
  end
end
