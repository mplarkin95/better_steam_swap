class SearchController < ApplicationController

  def index
    if params[:users]
    	@users = User.search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
      if @users.empty?
        @users = false
      end
    elsif params[:desc]
    	@items = Item.desc_search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
      if @items.empty?
        @items = false
      end
    elsif params[:advsearch] 
    	unless params[:users] and params[:desc]
    		@items = Item.search(params[:advsearch]).order("name").paginate(:page => params[:page], :per_page => 6)
    	end
      if @items.empty?
        @items = false
      end
    end
  end

end
