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
#  name                  :string
#  phone_number          :string
#  from_web              :boolean          default(FALSE)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @exam = orders(:exam)
    @homework = orders(:homework)
    @order = orders(:order)
  end

  test 'user is present' do
    @order.user = nil
    assert @order.invalid?
  end

  test 'category can be either urgent or homework' do
    valid_categories = %w(urgent homework)
    valid_categories.each do |category|
      @order.category = category
      assert @order.valid?
    end

    @order.category = 'test'
    assert @order.invalid?
  end

  test 'due_by is always present' do
    @order.due_by = nil
    assert @order.invalid?
  end

  test 'starts_at and due_by do not overlap' do
    @exam.starts_at = Time.zone.now + 1.day
    @exam.due_by = Time.zone.now - 1.day
    assert @exam.invalid?
  end

  test 'starts_at later than now' do
    new_exam = @exam.dup
    new_exam.starts_at = Time.zone.now - 1.day
    assert new_exam.invalid?
  end

  test 'validates starts_at only on create' do
    @exam.starts_at = Time.zone.now - 1.day
    assert @exam.valid?
  end

  test 'email is downcased before save' do
    email = 'FOO@BAR.COM'
    homework = Order.create(email: email, due_by: Time.zone.now + 1.year, user: @order.user)
    assert_equal email.downcase, homework.email
  end

  test 'invalid without refund amount' do
    @order.status = 'refunded'
    @order.refund_amount = nil
    assert @order.invalid?

    @order.refund_amount = 100
    assert @order.valid?
  end
end
