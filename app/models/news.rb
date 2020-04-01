class News < ActiveRecord::Base
  include Sluggable

  default_scope -> { order(published_at: :desc) }

  has_many :images, class_name: 'NewsImage', dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  mount_uploader :image, NewsUploader

  validates :name, :image, :published_at, presence: true
end
