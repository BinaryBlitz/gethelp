class AddOperatorToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :operator_id, :integer, index: true
  end
end
