class AddPersonToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :person, :string, after: :name, default: 'entity'
  end
end
