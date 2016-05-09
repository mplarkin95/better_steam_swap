class ItemsController < ApplicationController

  def index 
    @items = Item.all.order("name").paginate(:page => params[:page], :per_page => 6)
    if params[:search]
      @items = Item.search(params[:search]).order("name").paginate(:page => params[:page], :per_page => 6)
    end
  end

  def show 
  	@item = Item.find(params[:id])

    #check if item is in the user wishlist
    @inWishlist= Wishlist.exists?(:user_id => current_user.id, :item_id => @item.id)



    # Grabs all the users that have the current game
    user_ids = Inventory.where(item_id: @item.id).pluck(:user_id)
    @users = User.where(id: user_ids)

    # Grabs all the users that have the current game and have a 
    # game that you have in their wishlist
    @traders = Array.new
    user_games = Inventory.where(user_id: current_user.id).pluck(:item_id)
    @current_games = Item.where(id: user_games)




    for user in @users 
      unless current_user == user 
        wishlist = Wishlist.where(user_id: user.id).pluck(:item_id)
        for game in @current_games
          if wishlist.include?(game.id)
            @traders << user 
          end
        end
      end
    end

  end



end
