class CreateMainTexts < ActiveRecord::Migration
  def change
    create_table :main_texts do |t|
      t.string :name
      t.string :slug
      t.text :content

      t.timestamps null: false
    end
  end
end
