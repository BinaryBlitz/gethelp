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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @exam = orders(:exam)
    @homework = orders(:homework)
    @order = orders(:order)
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

  test 'starts_at and due_by do not overlap' do
    @exam.starts_at = Time.zone.now + 1.day
    @exam.due_by = Time.zone.now - 1.day
    assert @exam.invalid?
  end

  test 'starts_at later than now' do
    @exam.starts_at = Time.zone.now - 1.day
    assert @exam.invalid?
  end

  test 'email is downcased before save' do
    email = 'FOO@BAR.COM'
    homework = Order.new
    homework.email = email
    homework.save
    assert_equal email.downcase, homework.email
  end
end
