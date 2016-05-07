class ItemsController < ApplicationController

  def index 
    @items = Item.all
    if params[:search]
      @items = Item.search(params[:search]).order("name")
    else 
      @items = Item.all.order("name")
    end
  end

  def show 
  	@item = Item.find(params[:id])
  end

end
