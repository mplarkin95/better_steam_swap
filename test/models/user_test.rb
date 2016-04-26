require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name = "Example",email = "fake123@stupid.com",steamid="420blaziet",password = "fake")\
  end

  test "should be valid" do
  	assert @user.valid
  end

end
