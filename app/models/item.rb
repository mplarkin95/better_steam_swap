class Item < ActiveRecord::Base
	has_many :wishlists    
	has_many :users, through: :wishlists
	has_many :inventories 
	has_many :users, through: :inventories
	validates :id_steam, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
end
