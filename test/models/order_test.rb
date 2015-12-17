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
    @assignment = orders(:assignment)
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
    assignment = Order.new
    assignment.email = email
    assignment.save
    assert_equal email.downcase, assignment.email
  end
end
