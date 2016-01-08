class AddActivityTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :activity_type, :string
  end
end
