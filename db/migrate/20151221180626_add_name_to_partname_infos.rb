class AddNameToPartnameInfos < ActiveRecord::Migration
  def change
    add_column :partname_infos, :name, :string, after: :uid
  end
end
