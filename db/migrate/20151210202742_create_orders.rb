class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :course
      t.integer :grade
      t.string :category
      t.string :university
      t.string :faculty
      t.string :email
      t.datetime :starts_at
      t.datetime :due_by
      t.text :description

      t.timestamps null: false
    end
  end
end
