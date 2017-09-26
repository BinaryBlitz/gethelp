# == Schema Information
#
# Table name: orders
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  course                  :string
#  grade                   :integer
#  category                :string
#  university              :string
#  faculty                 :string
#  email                   :string
#  starts_at               :datetime
#  due_by                  :datetime
#  description             :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  sum                     :integer
#  status                  :string
#  activity_type           :string
#  operator_id             :integer
#  viewed_by_operator_at   :datetime
#  viewed_by_user_at       :datetime
#  refund_amount           :integer
#  name                    :string
#  phone_number            :string
#  from_web                :boolean          default(FALSE)
#  messages_read           :boolean          default(FALSE)
#  last_message_created_at :datetime
#

class Order < ActiveRecord::Base
  attr_accessor :due_by_date, :due_by_time

  before_save -> { self.email.downcase! if email }
  before_save -> { self.status = 'pending' if sum && status.new? }
  before_save :notify_user, unless: 'from_web?'
  after_create :send_email

  belongs_to :user
  belongs_to :operator
  has_one :payment
  has_many :messages

  validates :user, presence: true, unless: 'from_web?'
  validates :sum, numericality: { greater_than: 0 }, allow_blank: true
  validates :refund_amount, numericality: { greater_than: 0 }, if: 'status.refunded?'
  validates :due_by, presence: true
  validates :phone_number, phone: true, presence: true, if: 'from_web?'
  validate :due_time_valid?
  validate :start_time_valid?, on: :create

  include Phonable

  extend Enumerize
  enumerize :category, in: [:urgent, :homework], default: :homework
  enumerize :status, in: [:new, :pending, :paid, :rejected, :refunded], default: :new, scope: true

  def self.date_with_time(date, time)
    date + time.seconds_since_midnight.seconds
  end

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

  def send_email
    OrderMailer.new_order(self).deliver
  end
end
