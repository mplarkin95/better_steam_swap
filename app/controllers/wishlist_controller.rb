class WishlistController < ApplicationController
  def new
  	unless logged_in?
  		flash[:danger]="Please login before modifying your Wishlist"
  		redirect_to login_url
  	end
  	wish = Wishlist.where(user_id: current_user.id).pluck(:item_id)
  	@items = Item.where(id: wish)
  end

  def create
  	if !logged_in?
  		flash[ :danger]= "please login"
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

  def destroy
  	unless logged_in?
  		flash[:danger]="Please login before modifying your Wishlist"
  		redirect_to login_url
  	end

  	item_ids = params[:ids]

  	user = current_user
  	unless item_ids.nil?
	  	for item in item_ids
	  		wish_entry = Wishlist.where(user_id: user.id).where(item_id: item)
	  		wish_entry.delete_all
	  	end
	end
  	redirect_to user

  end

end
