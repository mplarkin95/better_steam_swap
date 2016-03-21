class Wishlist < ActiveRecord::Base
  belongs_to :items
  belongs_to :users
end
