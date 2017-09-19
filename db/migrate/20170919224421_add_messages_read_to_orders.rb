class AddMessagesReadToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :messages_read, :boolean, default: false
    add_column :orders, :last_message_created_at, :datetime
  end
end
