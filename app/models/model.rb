class Model < ActiveRecord::Base

  belongs_to :mark, foreign_key: :IDMARK
  belongs_to :typeauto, foreign_key: :TYPEAUTO, primary_key: :sort
  has_many :grouptrees, foreign_key: :IDMODEL
  has_many :partpictures, foreign_key: :IDMODEL

  validates :ID, :NAMESHORT, :mark, presence: true

  after_initialize :translit_name

  scope :by_type, ->(t) { where(TYPEAUTO: t) }
  scope :by_mark, ->(m) { where(IDMARK: m) }

  private

  def translit_name
    self.ENAMESHORT = self.NAMESHORT.to_s.parameterize if self.ENAMESHORT.blank?
    self.ENAMEFULL = self.NAMEFULL.to_s.parameterize if self.ENAMEFULL.blank?
  end

end