class SessionsController < ApplicationController
  def new
  	if logged_in?
  	redirect_to root_url
  	end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
	log_in user
	redirect_to current_user
    else
      flash.now[:danger] = "Invalid Email/Password Combination"
      render 'new'
    end
  end
  def destroy
  	logout
  	redirect_to root_url
  end
end
