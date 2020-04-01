class AddIsNewToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_new, :boolean, default: false, after: :number
  end
end
