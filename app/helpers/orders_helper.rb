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

module OrdersHelper
  def class_for_status(status)
    case status
    when 'new' then 'label-primary'
    when 'pending' then 'label-warning'
    when 'paid' then 'label-success'
    when 'rejected', 'refunded' then 'label-danger'
    else 'label-default'
    end
  end
end
