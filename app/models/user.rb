class User < ActiveRecord::Base
	has_many :wishlists
	has_many :items through :wishlists
	has_many :inventorys
	has_many :items through :inventorys
end
