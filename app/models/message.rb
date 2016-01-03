# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  category   :string
#  user_id    :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Message < ActiveRecord::Base
  after_create :notify_user

  belongs_to :user
  belongs_to :order

  validates :content, presence: true, unless: 'image?'
  validates :order, presence: true
  validates :user, presence: true, if: 'category && !category.operator?'
  validate :not_operator

  extend Enumerize
  enumerize :category, in: [:user, :operator, :complaint], default: :user

  mount_base64_uploader :image, ImageUploader

  private

  def not_operator
    return unless user
    errors.add(:category, 'is not permitted') if category.operator?
  end

  def notify_user
    return unless category.user?
    Notifier.new(user, 'У вас новое сообщение.')
  end
end
