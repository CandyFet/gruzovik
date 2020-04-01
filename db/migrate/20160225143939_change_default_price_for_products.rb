class ChangeDefaultPriceForProducts < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        change_column_default :products, :price, 0
        Product.update_all(price: 0)
      end
    end
  end
end
