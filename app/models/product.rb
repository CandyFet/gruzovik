class Product < ActiveRecord::Base
  belongs_to :category

  mount_uploader :image, PartnameInfoUploader

  validates :name, presence: true
  has_many :line_items, dependent: :nullify

  scope :by_category, ->(category) { where(category_id: category.subtree_ids) }

  def self.order_by(s)

    case s
      when 'sku'
        reorder(number: :asc)
      when 'price'
        reorder('price = 0, price ASC')
      else
        reorder(name: :asc)
    end
  end

  def get_similars
    if similars.present?
      Product.where(number: similars.split(','))
    else
      Product.none
    end
  end

  def self.promotion(p)
    where(promotion: p)
  end
end
