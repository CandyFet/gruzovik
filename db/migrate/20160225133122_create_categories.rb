class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :uid
      t.string :ancestry
      t.integer :position, default: 1000

      t.timestamps null: false
    end
  end
end
