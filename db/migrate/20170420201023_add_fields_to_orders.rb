class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :phone_number, :string
  end
end
