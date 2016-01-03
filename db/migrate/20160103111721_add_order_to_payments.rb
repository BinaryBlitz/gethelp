class AddOrderToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :order, index: true
    remove_reference :payments, :user, index: true
    add_column :orders, :sum, :integer
  end
end
