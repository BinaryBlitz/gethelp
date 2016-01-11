# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notification < ActiveRecord::Base
  after_create :notify

  validates :message, presence: true

  private

  def notify
    User.all.find_each { |user| Notifier.new(user, message) }
  end
end
