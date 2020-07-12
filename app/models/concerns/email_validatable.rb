require 'mail'

module EmailValidatable
  extend ActiveSupport::Concern

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      begin
        email = Mail::Address.new(value)
      rescue Mail::Field::ParseError
        record.errors[attribute] << (options[:message] || 'is not an email')
      end

      unless value.blank? || email.domain.eql?(options[:domain])
        record.errors[attribute] << (options[:message] || "domain allow only #{options[:domain]}")
      end
    end
  end
end
