class Form::Rental < ActiveRecord::Base
  validates :name, :phone, presence: true
end
