class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.boolean :is_page, default: true
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
