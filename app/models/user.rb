class User < ApplicationRecord
	validates :firstname, :lastname, :email, :password, presence: true
	validates :lastname, :email, :password,  uniqueness: true
end
