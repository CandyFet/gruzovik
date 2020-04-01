class AddSimilarsToPartnameInfo < ActiveRecord::Migration
  def change
    add_column :partname_infos, :similars, :text, after: :description
  end
end
