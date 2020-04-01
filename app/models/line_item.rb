class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :model, foreign_key: :IDMODEL
  belongs_to :partname, foreign_key: :PARTNAMEID
  belongs_to :grouptree, foreign_key: :IDGROUP
  belongs_to :product

  validates :name, presence: true
  validates :amount, :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.total_sum
    all.inject(0) { |sum, li| sum += li.price.to_i * li.amount }
  end
end
