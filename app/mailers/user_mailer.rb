class UserMailer < ActionMailer::Base
  default from: 'yourideasaremine@gmail.com'

  def welcome_email(user)
  	@user = user
  	#@url = 'http://www.bettersteamswap.com/login'
  	mail(to: @user.email, subject: 'Welcome to Better Steam Swap!')
  end
end