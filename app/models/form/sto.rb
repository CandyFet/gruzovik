class Form::Sto < ActiveRecord::Base
  validates :name, :phone, presence: true
end
