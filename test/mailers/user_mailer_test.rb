require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
	test "welcome_email" do 
		email = UserMailer.welcome_email('f1rstplay3r')
		email.deliver_now
		assert_not ActionMailer::Base.deliveries.empty?
	end
end