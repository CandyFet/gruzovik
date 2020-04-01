class AddDescriptionBottomToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :description_bottom, :text, after: :description
  end
end
