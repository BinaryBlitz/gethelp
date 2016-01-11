class AddTimestampsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :viewed_by_operator_at, :datetime
    add_column :orders, :viewed_by_user_at, :datetime
  end
end
