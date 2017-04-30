class AddFromWebToSite < ActiveRecord::Migration
  def change
    add_column :orders, :from_web, :boolean, default: false
  end
end
