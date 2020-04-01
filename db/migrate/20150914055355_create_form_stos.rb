class CreateFormStos < ActiveRecord::Migration
  def change
    create_table :form_stos do |t|
      t.string :name
      t.string :phone
      t.string :type_of_work
      t.string :convenient_date

      t.timestamps null: false
    end
  end
end
