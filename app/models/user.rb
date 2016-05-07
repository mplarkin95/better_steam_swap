class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	has_many :wishlists  , dependent: :destroy
	has_many :items, through: :wishlists
	has_many :inventories  , dependent: :destroy
	has_many :items, through: :inventories

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_STEAMURL_REGEX = /(http:\/\/steamcommunity.com\/)(id\/\w+\/)|(http:\/\/steamcommunity.com\/)(profile\/\d+\/)/i
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	validates :steam_id, format: {with: VALID_STEAMURL_REGEX}, allow_nil: true
end

