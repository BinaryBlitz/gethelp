class CreateCallBacks < ActiveRecord::Migration
  def change
    create_table :call_backs do |t|
      t.string :name, null: false
      t.string :phone_number, null: false

      t.timestamps null: false
    end
  end
end
