class AddFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image, :string, after: :uid
    add_column :categories, :description, :text, after: :image
  end
end
