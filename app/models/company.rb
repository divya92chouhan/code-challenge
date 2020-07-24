class Company < ApplicationRecord
  include EmailValidatable
  
  has_rich_text :description

  validates :zip_code, presence: true
  validates :email, email: { domain: 'getmainstreet.com' }

  before_save :set_address_attrs

  private

  def set_address_attrs
    address_info = ZipCodes.identify(zip_code)

    if address_info.nil?
      errors.add(:zip_code, 'invalid')
      raise ActiveRecord::RecordInvalid, self
    end

    self.state = address_info[:state_name]
    self.city = address_info[:city]
  end  
end
