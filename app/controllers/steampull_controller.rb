class SteampullController < ApplicationController
	before_action :valid_login
	
	def new
		@user = current_user
	end
	def create
		flash[ :success] = "It worked!"
		redirect_to steampull_url, :method => :new
	end

	private

	def valid_login
		unless logged_in?
			flash[ :error]= "Please Login First"
			redirect_to login_url
		end
end
end
