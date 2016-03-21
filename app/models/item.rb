class Item < ActiveRecord::Base
	has_many :wishlists
	has_many :users through :wishlists
	has_many :inventorys
	has_many :users through :inventorys
end
