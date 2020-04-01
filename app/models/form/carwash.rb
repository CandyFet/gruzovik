class Form::Carwash < ActiveRecord::Base
  validates :name, :phone, presence: true
end
