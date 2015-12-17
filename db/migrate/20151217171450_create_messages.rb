class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :category
      t.belongs_to :user, index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
  end
end
