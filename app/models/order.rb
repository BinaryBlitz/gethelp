# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  course      :string
#  grade       :integer
#  category    :string
#  university  :string
#  faculty     :string
#  email       :string
#  starts_at   :datetime
#  due_by      :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :user
  before_save -> { self.email.downcase! if self.email }

  validate :end_time_valid?
  validate :start_time_valid?

  private

  def end_time_valid?
    return unless starts_at && due_by

    errors.add(:due_by, 'is less than starts_at') if due_by < starts_at
  end

  def start_time_valid?
    return unless starts_at

    errors.add(:starts_at, 'is less than now') if starts_at < Time.zone.now
  end
end
