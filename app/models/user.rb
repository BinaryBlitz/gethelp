# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  balance      :integer          default(0)
#

class User < ActiveRecord::Base
  attr_accessor :verification_token

  phony_normalize :phone_number, default_country_code: 'RU'

  has_many :orders
  has_many :messages
  has_many :payments

  validates :phone_number, presence: true, uniqueness: true, phony_plausible: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validate :verified_phone_number

  has_secure_token :api_token

  def deposit(sum)
    update(balance: balance + sum)
  end

  private

  def verified_phone_number
    return if VerificationToken.verified.find_by(phone_number: phone_number)
    errors.add(:phone_number, "isn't verified")
  end
end
