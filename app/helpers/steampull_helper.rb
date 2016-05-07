require_relative "game.rb"
module SteampullHelper
	
	def pull(user)
		hash = Game.new(user.steam_id)
		games = hash.return_games
		for game in games
			game_hash = hash.get_game_info(game)
			img_tag = game_hash["img_url"]
			puts img_tag
			# switch this to unless
			# unless == if !Item
			if !Item.exists?(:name => game)
				new_game = Item.new(:name => game, :description => game_hash["description"], :id_steam => game_hash["classid"], 
					:steam_url => game_hash["link"], :img_url =>game_hash["img_url"])
				new_game.save 
			end

			game_model = Item.find_by(:name => game)

			if Inventory.exists?(:item_id =>game_model.id, :user_id => user.id)
				inv = Inventory.find_by(:item_id =>game_model.id, :user_id => user.id)
				if inv.quantity != game_hash["amount"]
					inv.quantity = game_hash["amount"]
					inv.save
				end
			else
				new_inv = Inventory.new(:item_id => game_model.id, :user_id => user.id, :quantity => game_hash["amount"])
				new_inv.save
			end
		end
		
	end	 
end
