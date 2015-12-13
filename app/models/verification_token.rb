# == Schema Information
#
# Table name: verification_tokens
#
#  id           :integer          not null, primary key
#  token        :string
#  phone_number :string
#  code         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class VerificationToken < ActiveRecord::Base
  before_validation :generate_code

  has_secure_token

  private

  def generate_code
    self.code = Random.new.rand(1000..9999)
  end
end
