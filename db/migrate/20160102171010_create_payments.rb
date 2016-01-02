class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user, index: true
      t.integer :sum
      t.boolean :paid, default: false

      t.timestamps null: false
    end
  end
end
