class AddNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :number, :string, after: :uid
  end
end
