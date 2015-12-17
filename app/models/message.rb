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
#

class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates :content, presence: true
  validates :order, presence: true
  validates :user, presence: true, if: 'category && !category.operator?'

  extend Enumerize
  enumerize :category, in: [:user, :operator, :complaint], default: :user
end
