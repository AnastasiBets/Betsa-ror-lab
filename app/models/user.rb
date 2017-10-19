class User < ApplicationRecord
	validates :firstname, :lastname, :email, :password, presence: true
end
