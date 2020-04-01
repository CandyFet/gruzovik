class AddDeliveryToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery, :string, after: :person, default: 'pickup'
  end
end
