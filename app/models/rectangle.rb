class Rectangle < ActiveRecord::Base

  self.table_name = 'rectangle'
  self.primary_key = :ID

  has_many :pplrs, dependent: :destroy, foreign_key: :IDRECTANGLE
  has_many :partpictures, through: :pplrs

  def get_x_width
    if self.DX.present?
      res = self.DX
      res = res << 6
      res = res ^ '00000000ffffffff'.to_i(16).to_s(10).to_i
      res = res ^ 63662419
      res = res >> 6
      x = (res / 1000).round
      width = res - (res / 1000).round * 1000
      {x: x, width: width}
    else
      false
    end
  end

  def get_y_height
    if self.DY.present?
      res = self.DY
      res = res << 6
      res = res ^ '00000000ffffffff'.to_i(16).to_s(10).to_i
      res = res ^ 63662419
      res = res >> 6
      y = (res / 1000).round
      height = res - (res / 1000).round * 1000
      {y: y, height: height}
    else
      false
    end
  end

end