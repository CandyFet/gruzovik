class AddFileNameToPartnameInfos < ActiveRecord::Migration
  def change
    add_column :partname_infos, :file_name, :string, after: :length
  end
end
