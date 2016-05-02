class UsersController < ApplicationController
  #before_action: valid_login, only: [:edit, :update] 
	def show
		@user = User.find(params[:id])
    if logged_in?
      @myprofile = (@user.id == current_user.id)
      @games = @user.items
      
    else
      @myprofile = false
    end
	end

	def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      UserMailer.welcome_email(@user).deliver_now
      redirect_to steampull_url
    else
      render 'new'
    	end
  	end

  def edit
  end   

  	private

    def user_params
      params.require(:user).permit(:name, :email, :password, :steam_id,
                                   :password_confirmation)
    end

    def valid_login
    unless logged_in?
      flash[ :error]= "Please Login First"
      redirect_to login_url
    end
  end
end
