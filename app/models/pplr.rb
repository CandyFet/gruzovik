class Pplr < ActiveRecord::Base

  self.table_name = 'pplr'
  self.primary_key = :IDRECTANGLE

  belongs_to :partpicture, foreign_key: :IDPARTPICTURE
  belongs_to :rectangle, foreign_key: :IDRECTANGLE

end