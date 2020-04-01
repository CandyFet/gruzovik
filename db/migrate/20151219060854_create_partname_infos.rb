class CreatePartnameInfos < ActiveRecord::Migration
  def change
    create_table :partname_infos do |t|
      t.integer :PARTNAMEID, index: true
      t.integer :price, default: 0

      t.timestamps null: false
    end
  end
end
