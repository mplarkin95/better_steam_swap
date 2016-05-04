class HomeController < ApplicationController
  def new
  	@items = Item.all
  end
end
