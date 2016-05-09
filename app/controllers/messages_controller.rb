class MessagesController < ApplicationController
	def index
		unless logged_in?
			flash[:danger]="please login"
			redirect_to login_url
			return
		end
		@user = current_user
		@inbox = Message.where(receiver_id: @user.id, receiver_delete: false).order("created_at desc")
		@sent = Message.where(sender_id: @user.id, sender_delete: false ).order("created_at desc")
	end

	def new
		if params[:recipient]
			r = params[:recipient]
			@recipient = User.find(r)
		else
			@recipient = false
		end
		if params[:game_trade]
			@game_trade = true
		else
			@game_trade = false
		end

		@message = Message.new(:sender_id =>current_user.id, :trade =>@game_trade)

		@dropdown = []
		
		for person in User.where.not(id: current_user.id)
			@dropdown << [person.name,person.id]
		end

		if @game_trade
			mygames = Item.where(id: Inventory.where(user_id: current_user.id ).pluck(:item_id))

			@mygames = []

			for g in mygames
				@mygames << [g.name,g.id]
			end

			@theirgames = []
			if @recipient
				for g in Item.where(id: Inventory.where(user_id: @recipient.id).pluck(:item_id))
					@theirgames<<[g.name, g.id]
				end
			else
				for g in Item.all
					@theirgames <<[g.name, g.id]
				end
			end

			@selected_game = Item.find(params[:game_trade][:item_req])
		end


	end

	def create
		n = Message.new(msg_params)
		n.save
		redirect_to messages_path :method => :index
	end

	def update_seen
		n = Message.find(params[:msg_id])
		n.seen = true
		if n.save
			response = 'Successful'
		else 
			response = 'Failure'
		end
		respond_to do |format|
			format.js {render nothing: true, :notice => response}
		end
	end

	def delete
		n = Message.find(params[:msg_id])
		if n.sender_id == current_user.id
			n.sender_delete = true
		end
		
		if n.receiver_id == current_user.id
			n.receiver_delete = true
		end
		
		if n.sender_delete && n.receiver_delete
			n.destroy
		else
			if n.save
				response = 'Successful'
			else 
				response = 'Failure'
			end
			
			respond_to do |format|
				format.js {render nothing: true, :notice => response}
			end
		end
		
	end
	private

    def msg_params
      params.require(:message).permit(:sender_id, :receiver_id, :rec_item_id, :sent_item_id,
                                   :trade, :message)
    end
end
