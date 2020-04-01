class AddPaymentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment, :string, after: :delivery, default: 'bill'
  end
end
