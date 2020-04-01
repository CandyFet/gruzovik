class Category < ActiveRecord::Base
  default_scope -> { order(:position) }

  has_ancestry

  has_many :products, dependent: :destroy

  mount_uploader :image, CategoryUploader

  validates :name, presence: true
end
