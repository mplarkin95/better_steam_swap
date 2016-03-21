class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :id_steam , unique: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
