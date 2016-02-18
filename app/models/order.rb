# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  course                :string
#  grade                 :integer
#  category              :string
#  university            :string
#  faculty               :string
#  email                 :string
#  starts_at             :datetime
#  due_by                :datetime
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  sum                   :integer
#  status                :string
#  activity_type         :string
#  operator_id           :integer
#  viewed_by_operator_at :datetime
#  viewed_by_user_at     :datetime
#  refund_amount         :integer
#

class Order < ActiveRecord::Base
  before_save -> { self.email.downcase! if email }
  before_save -> { self.status = 'pending' if sum && status.new? }
  before_save :notify_user

  belongs_to :user
  belongs_to :operator
  has_one :payment
  has_many :messages

  validates :user, presence: true
  validates :sum, numericality: { greater_than: 0 }, allow_blank: true
  validates :refund_amount, numericality: { greater_than: 0 }, if: 'status.refunded?'
  validates :due_by, presence: true
  validates :starts_at, presence: true, if: 'category&.urgent?'
  validate :due_time_valid?
  validate :start_time_valid?, on: :create

  extend Enumerize
  enumerize :category, in: [:urgent, :homework], default: :homework
  enumerize :status, in: [:new, :pending, :paid, :rejected, :refunded], default: :new, scope: true

  delegate :phone_number, to: :user

  def view_as_operator
    touch(:viewed_by_operator_at)
  end

  def view_as_user
    touch(:viewed_by_user_at)
  end

  def viewed_by_user?
    return true unless viewed_by_user_at.present?

    last_message = messages.with_category(:operator).order(created_at: :desc).first
    return true unless last_message

    last_message.created_at < viewed_by_user_at
  end

  alias_method :viewed?, :viewed_by_user?

  def viewed_by_operator?
    return true unless viewed_by_operator_at.present?

    last_message = messages.with_category(:user).order(created_at: :desc).first
    return true unless last_message

    last_message.created_at < viewed_by_operator_at
  end

  private

  def due_time_valid?
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
