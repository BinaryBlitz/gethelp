# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  device_token :string
#  platform     :string
#

class User < ActiveRecord::Base
  attr_accessor :verification_token

  has_many :orders
  has_many :messages
  has_many :payments

  validates :phone_number, presence: true, uniqueness: true, phone: true
  validates :platform, inclusion: { in: %w(android ios) }, if: 'device_token.present?'
  validate :verified_phone_number

  has_secure_token :api_token

  include Phonable

  private

  def verified_phone_number
    return if VerificationToken.verified.find_by(phone_number: phone_number)
    errors.add(:phone_number, "isn't verified")
  end
end
