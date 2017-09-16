class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :content
      t.string :image
      t.boolean :promo, default: false

      t.timestamps
    end
  end
end
