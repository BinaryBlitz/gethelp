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
#  sum         :integer
#  status      :string
#

class Order < ActiveRecord::Base
  before_save -> { self.email.downcase! if email }
  before_save -> { self.status = 'pending' if sum && status.new? }
  before_save :notify_user

  belongs_to :user
  has_one :payment
  has_many :messages

  validates :user, presence: true
  validates :sum, numericality: { greater_than: 0 }, allow_blank: true
  validates :due_by, presence: true
  validates :starts_at, presence: true, if: 'category && category.urgent?'
  validate :end_time_valid?
  validate :start_time_valid?, on: :create

  extend Enumerize
  enumerize :category, in: [:urgent, :homework], default: :homework
  enumerize :status, in: [:new, :pending, :paid, :rejected, :refunded], default: :new, scope: true

  delegate :phone_number, to: :user

  private

  def end_time_valid?
    return unless starts_at && due_by

    errors.add(:due_by, 'is less than starts_at') if due_by < starts_at
  end

  def start_time_valid?
    return unless starts_at

    errors.add(:starts_at, 'is less than now') if starts_at < Time.zone.now
  end

  def notify_user
    return unless status_changed?
    Notifier.new(user, 'Статус вашего заказа был изменен!')
  end
end
