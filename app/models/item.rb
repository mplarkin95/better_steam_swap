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

    def self.trader?(item, current_user)
      user_ids = Inventory.where(item_id: item.id).pluck(:user_id)
      users = User.where(id: user_ids)

      # Grabs all the users that have the current game and have a 
      # game that you have in their wishlist
      traders = Array.new
      user_games = Inventory.where(user_id: current_user.id).pluck(:item_id)
      current_games = Item.where(id: user_games)




      for user in users 
        unless current_user == user 
          wishlist = Wishlist.where(user_id: user.id).pluck(:item_id)
          for game in current_games
            if wishlist.include?(game.id)
              #traders << user 
              return true
            end
          end
        end
      end
      return false

    end

end
