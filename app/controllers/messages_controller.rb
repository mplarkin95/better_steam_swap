class MessagesController < ApplicationController
	def index
		@user = current_user
		@inbox = Message.where(receiver_id: @user.id)
		@sent = Message.where(sender_id: @user.id )
	end
end
