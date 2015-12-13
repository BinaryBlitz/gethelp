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
  phony_normalize :phone_number, default_country_code: 'RU'

  validates :phone_number, presence: true, uniqueness: true, phony_plausible: true
end
