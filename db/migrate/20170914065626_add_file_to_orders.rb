class AddFileToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :file, :string
  end
end
