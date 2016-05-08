class SearchController < ApplicationController
	def index
    if params[:users]
    	@users = User.search(params[:search]).order("name")
    elsif params[:desc]
    	@items = Item.desc_search(params[:search]).order("name")
    elsif params[:search] 
    	unless params[:users] and params[:desc]
    		@items = Item.search(params[:search]).order("name")
    	end
    end
  end
end
