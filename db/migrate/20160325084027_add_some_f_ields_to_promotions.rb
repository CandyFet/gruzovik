class AddSomeFIeldsToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :image, :string
    add_column :promotions, :slug, :string, after: :name
    add_column :promotions, :on_main, :boolean, default: false, after: :slug
    remove_column :promotions, :link, :string
  end
end
