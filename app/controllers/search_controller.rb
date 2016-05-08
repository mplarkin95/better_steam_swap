class SearchController < ApplicationController
	def index
    if params[:users]
    	@users = User.search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
    elsif params[:desc]
    	@items = Item.desc_search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
    elsif params[:advsearch] 
    	unless params[:users] and params[:desc]
    		@items = Item.search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
    	end
    end
  end
end
