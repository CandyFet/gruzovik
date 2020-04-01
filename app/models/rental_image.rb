class RentalImage < ActiveRecord::Base
  default_scope -> { order(:position) }

  mount_uploader :file, RentalImageUploader

  validates :file, presence: true
end
