# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  sum        :integer
#  paid       :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

class Payment < ActiveRecord::Base
  before_validation :set_sum

  belongs_to :order

  validates :order, presence: true
  validates :sum, numericality: { greater_than: 0 }

  delegate :user, to: :order

  def pay_url
    return unless valid?
    Rubykassa.pay_url(id, sum, {})
  end

  def set_paid
    Payment.transaction do
      update(paid: true)
      order.update(status: 'paid')
    end
  end

  private

  def set_sum
    self.sum = order.sum
  end
end
