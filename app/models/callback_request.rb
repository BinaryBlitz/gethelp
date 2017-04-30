# == Schema Information
#
# Table name: callback_requests
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CallbackRequest < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true, phone: true

  after_create :send_email

  include Phonable

  private

  def send_email
    CallbackRequestMailer.new_callback_request(self).deliver
  end
end
