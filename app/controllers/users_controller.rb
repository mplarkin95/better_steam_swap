class UsersController < ApplicationController
  before_action :valid_login, only: :edit
	def show
		@user = User.find(params[:id])
    if logged_in?
      @myprofile = (@user.id == current_user.id)
      inv_ids = Inventory.where(user_id: @user.id).pluck(:item_id)
      wish_ids = Wishlist.where(user_id: @user.id).pluck(:item_id)
      
      @games = Item.where(id: inv_ids)
      @wishlist = Item.where(id: wish_ids)

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
      redirect_to steampull_url
    else
      render 'new'
    	end
  	end

  def edit
    if User.find(params[:id]).id != current_user.id
      flash[ :error]="Illegal Maneuver Hombre"
      redirect_to current_user
    else
      @user= current_user
    end
  end   

  def update

    if current_user.update(user_params)
      redirect_to current_user
    else
      flash[ :error]= "incorrect "
    end
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
