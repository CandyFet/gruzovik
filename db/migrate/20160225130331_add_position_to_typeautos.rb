class AddPositionToTypeautos < ActiveRecord::Migration
  def change
    add_column :typeauto, :position, :integer, default: 100
  end
end
