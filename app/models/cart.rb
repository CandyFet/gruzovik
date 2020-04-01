class Cart < ActiveRecord::Base
  belongs_to :order
  has_many :line_items, dependent: :destroy
end
