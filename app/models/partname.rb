class Partname < ActiveRecord::Base
  self.table_name = 'partname'

  has_many :partpictures, dependent: :destroy, foreign_key: :PARTNAMEID
  has_one :info, class_name: 'PartnameInfo', foreign_key: :PARTNAMEID
  belongs_to :mark, foreign_key: :IDMARK

  validates :ID, presence: true

  def get_similars
    if info.similars.present?
      Partname.where(NUMBER: info.similars.split(','))
    else
      Partname.none
    end
  end
end