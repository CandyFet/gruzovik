class AddAdditionalFieldsToPartnameInfo < ActiveRecord::Migration
  def change
    add_column :partname_infos, :uid, :string, after: :PARTNAMEID
    add_column :partname_infos, :residue, :integer, after: :price, default: 0
    add_column :partname_infos, :image, :string, after: :residue
    add_column :partname_infos, :description, :text, after: :image
    add_column :partname_infos, :width, :float, after: :description
    add_column :partname_infos, :height, :float, after: :width
    add_column :partname_infos, :length, :float, after: :height
  end
end
