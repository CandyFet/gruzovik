class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.string :slug
      t.date :published_at
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
