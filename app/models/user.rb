class User < ApplicationRecord
	validates :firstname, :lastname, :email, :password, presence: true
	validates :lastname, :email, :password,  uniqueness: true
	#validates :password, numericality: true
	validates :password, numericality: { only_integer: true }
#include PrettyEmailValidatable
#validates :pretty_email, email: true
	#validates :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	#validates :email, email_format: { message: "doesn't look like an email address" }
end
