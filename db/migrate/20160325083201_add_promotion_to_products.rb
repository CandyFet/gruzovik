class AddPromotionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :promotion, :string, after: :is_new
  end
end
