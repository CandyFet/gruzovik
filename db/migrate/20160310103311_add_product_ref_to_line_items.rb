class AddProductRefToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :product, index: true, foreign_key: true, after: :IDGROUP
  end
end
