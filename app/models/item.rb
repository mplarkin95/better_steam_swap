class Item < ActiveRecord::Base
	has_many :wishlists  , dependent: :destroy  
	has_many :users, through: :wishlists
	has_many :inventories , dependent: :destroy
	has_many :users, through: :inventories
	has_many :sent, :class_name => 'Message', :foreign_key => :sne_item_id, dependent: :destroy
	has_many :received, :class_name => 'Message',:foreign_key => :rec_item_id, dependent: :destroy
	validates :id_steam, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true

	# Search goes through:
	# - item name
	# - item description
	# - item steam id
	def self.search(search)
		where("name LIKE ?", "%#{search}%")
		#where("description LIKE ?", "%#{search}%")
		#where("id_steam LIKE ?", "%#{search}%")
	end

	def self.desc_search(desc)
		where("description LIKE ?", "%#{desc}%")
    end

end
