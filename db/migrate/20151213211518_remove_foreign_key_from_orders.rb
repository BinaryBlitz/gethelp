class RemoveForeignKeyFromOrders < ActiveRecord::Migration
  def change
    remove_foreign_key :orders, :users
  end
end
