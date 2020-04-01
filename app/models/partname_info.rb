class PartnameInfo < ActiveRecord::Base
  belongs_to :partname, foreign_key: :PARTNAMEID

  mount_uploader :image, PartnameInfoUploader

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
