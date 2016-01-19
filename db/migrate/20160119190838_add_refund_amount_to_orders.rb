class AddRefundAmountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :refund_amount, :integer
  end
end
