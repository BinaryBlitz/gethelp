class RemoveBalanceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :balance, :integer, default: 0
  end
end
