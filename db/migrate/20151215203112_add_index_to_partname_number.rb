class AddIndexToPartnameNumber < ActiveRecord::Migration
  def change
    add_index :partname, :NUMBER
  end
end
