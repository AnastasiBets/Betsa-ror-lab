class User < ApplicationRecord
	validates :firstname, :lastname, :email, :password,:country, :city, :house_number, presence: true
	validates :house_number, numericality: { only_integer: true  }	
	validates :firstname, :lastname, :country, :city, format: { with: /\A[a-zA-Z]+\z/, message: ":only letters!"}
	validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "has invalid email adress"}
	#validates :firstname, :lastname, :email, :password, presence: true
	#validates :lastname, :email, :password,  uniqueness: true
	#validates :password, numericality: true
	validates :password, numericality: { only_integer: true }
#include PrettyEmailValidatable
#validates :pretty_email, email: true
	#validates :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	#validates :email, email_format: { message: "doesn't look like an email address" }
end
