# == Schema Information
#
# Table name: call_backs
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CallBack < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true, phone: true

  include Phonable
end
