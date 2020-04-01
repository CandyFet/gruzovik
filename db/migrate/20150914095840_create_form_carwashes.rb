class CreateFormCarwashes < ActiveRecord::Migration
  def change
    create_table :form_carwashes do |t|
      t.string :name
      t.string :amount
      t.string :fio
      t.string :phone

      t.timestamps null: false
    end
  end
end
