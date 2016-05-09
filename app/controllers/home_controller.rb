class HomeController < ApplicationController
  def new
  	@items = Item.all
  end

  def show 
  end
  
end
