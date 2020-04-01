class Mark < ActiveRecord::Base

  default_scope -> { order(:SORTORDER, :NAMESHORT) }

  has_many :models, dependent: :destroy, foreign_key: :IDMARK
  has_many :partnames, foreign_key: :IDMARK

  validates :ID, :NAMESHORT, presence: true

  after_initialize :translit_name

  private

  def translit_name
    self.ENAMESHORT = self.NAMESHORT.to_s.parameterize if self.ENAMESHORT.blank?
    self.ENAMEFULL = self.NAMEFULL.to_s.parameterize if self.ENAMEFULL.blank?
  end

end