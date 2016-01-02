# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sum        :integer
#  paid       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ActiveRecord::Base
  PAYMENT_OPTIONS = [500, 1000, 1500, 2000]

  belongs_to :user

  validates :user, presence: true
  validates :sum, inclusion: { in: PAYMENT_OPTIONS }

  def pay_url
    return unless valid?
    Rubykassa.pay_url(id, sum, {})
  end

  def set_paid
    Payment.transaction do
      user.deposit(sum)
      update(paid: true)
    end
  end
end
