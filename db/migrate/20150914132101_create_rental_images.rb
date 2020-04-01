class CreateRentalImages < ActiveRecord::Migration
  def change
    create_table :rental_images do |t|
      t.string :file
      t.integer :position, default: 100

      t.timestamps null: false
    end
  end
end
