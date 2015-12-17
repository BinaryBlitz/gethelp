# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessor :verification_token

  phony_normalize :phone_number, default_country_code: 'RU'

  has_many :orders

  validates :phone_number, presence: true, uniqueness: true, phony_plausible: true
  validate :verified_phone_number

  has_secure_token :api_token

  private

  def verified_phone_number
    return if VerificationToken.verified.find_by(phone_number: phone_number)
    errors.add(:phone_number, "isn't verified")
  end
end
