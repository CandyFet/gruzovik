class CreateTableLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name, index: true
      t.references :cart, index: true, foreign_key: true
      t.string :number
      t.integer :amount
      t.integer :price
      t.integer :IDMODEL, index: true
      t.integer :PARTNAMEID, index: true
      t.integer :IDGROUP, index: true

      t.timestamps null: false
    end
  end
end
