class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.date :published_at
      t.text :content
      t.string :link

      t.timestamps null: false
    end
  end
end
