class SteampullController < ApplicationController
	before_action :valid_login
	include SteampullHelper
	
	def new
		@user = current_user
	end
	def create
		begin
			pull current_user
				
		rescue ArgumentError
			flash[ :warning] = "Please check if your steam inventory is set to private!"
			redirect_to current_user, :method => :new
			return
			
		rescue ParseError
			flash[ :warning] = "Please check if your steam URL is correct!"
			redirect_to current_user, :method => :new
			return
		end

		flash[ :success] = "inventory updated"
		redirect_to current_user, :method => :new
	end


	def update
		user = current_user
		user.update(update_params)
		if user.save
			flash[ :success] = "Updated Steam URL"
			redirect_to steampull_url, :method => :new
		else
			flash[ :warning] = "Check Steam URL and try"
			redirect_to current_user
		end
	end
	private

	def valid_login
		unless logged_in?
			flash[ :error]= "Please Login First"
			redirect_to login_url
		end
	end
	def update_params
      params.require(:user).permit(:steam_id, :password)
    end
end
