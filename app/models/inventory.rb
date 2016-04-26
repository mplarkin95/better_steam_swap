class Inventory < ActiveRecord::Base
  belongs_to :items
  belongs_to :users

  unless Inventory.where(:id => current_inventory.id).blank?
    # Inventory.create(:column1 => 'data', :column2 => 'data') 
    # What this does is that if Inventory does not have an entry in it's
    # corresponding table then it'll add it into the table
    # we can grab the data in the example line (first comment) by using the 
    # ruby gem that I've made
  end
end
