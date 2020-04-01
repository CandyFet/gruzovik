class Partpicture < ActiveRecord::Base

  self.table_name = 'partpicture'

  belongs_to :model, foreign_key: :IDMODEL
  belongs_to :grouptree, foreign_key: :IDGROUP
  belongs_to :partname, foreign_key: :PARTNAMEID
  has_many :pplrs, dependent: :destroy, foreign_key: :IDPARTPICTURE
  has_many :rectangles, through: :pplrs

  scope :by_model, ->(m) { where(IDMODEL: m) }

  def self.order_by(s)

    case s
      when 'sku'
        includes(:partname).reorder('partname.NUMBER ASC')
      when 'price'
        includes(partname: :info).reorder('partname_infos.price = 0, partname_infos.price')
      else
        includes(:partname).reorder('partname.NAME ASC')
    end
  end

end