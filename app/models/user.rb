class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	has_many :wishlists
	has_many :items, through: :wishlists
	has_many :inventorys
	has_many :items, through: :inventorys

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end

