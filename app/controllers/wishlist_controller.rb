class WishlistController < ApplicationController
  def new
  	@items = Item.all
  end

  def create
  	if !logged_in?
  		flash[ :error]= "please login"
  		redirect_to login_url
  	else
	  	item_ids = params[ :items_ids]
	  	user = current_user
	  	
	  	for item in item_ids 
	  		n = Wishlist.new(:user_id => current_user.id, :item_id => item)
	  		n.save
	  	end
	  	redirect_to current_user
	end
  end



end
