class Employee < ActiveRecord::Base
  default_scope -> { order(:position) }

  mount_uploader :image, EmployeeUploader

  validates :name, :image, :position, presence: true
end
