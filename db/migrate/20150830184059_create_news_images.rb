class CreateNewsImages < ActiveRecord::Migration
  def change
    create_table :news_images do |t|
      t.string :file
      t.references :news, parts: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
