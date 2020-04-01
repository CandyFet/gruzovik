class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.string :uid
      t.integer :price
      t.integer :residue
      t.string :image
      t.text :description
      t.text :similars
      t.float :width
      t.float :height
      t.float :length
      t.string :file_name

      t.timestamps null: false
    end
  end
end
