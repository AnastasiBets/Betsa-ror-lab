require 'email'

module PrettyEmailValidatable
  extend ActiveSupport::Concern

  class PrettyEmailValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      begin
        a = Mail::Address.new(value)
      rescue Mail::Field::ParseError
        record.errors[attribute] << (options[:message] || "is not an email")
      end

      # regexp from http://guides.rubyonrails.org/active_record_validations.html
      value = a.address
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end

  end
end