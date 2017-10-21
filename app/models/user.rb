class User < ApplicationRecord
	validates :firstname, :lastname, :email, :password, presence: true
	validates :lastname, :email, :password,  uniqueness: true
	#validates :password, numericality: true
	validates :password, numericality: { only_integer: true }
end
