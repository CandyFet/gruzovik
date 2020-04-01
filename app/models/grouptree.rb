class Grouptree < ActiveRecord::Base

  default_scope -> { order(:GROUPNAME) }

  self.table_name = 'grouptree'
  # self.primary_keys = :IDMODEL, :GROUPNO
  self.primary_key = :GROUPNO

  belongs_to :model, foreign_key: :IDMODEL
  belongs_to :parent_group, class_name: 'Grouptree', foreign_key: :PARENT
  has_many :children_groups, class_name: 'Grouptree', foreign_key: :PARENT
  has_many :partpictures, foreign_key: :IDGROUP

  validates :GROUPNAME, presence: true

  after_initialize :translit_name

  scope :by_model, ->(m) { where(IDMODEL: m) }
  scope :root_groups, -> { where("PARENT = '' OR PARENT IS NULL OR PARENT = 0") }

  private

  def translit_name
    self.GROUPNAMEEN = self.GROUPNAME.to_s.parameterize if self.GROUPNAME.blank?
  end

  # def composite_key
  #   "#{self.IDMODEL}-#{self.GROUPNO}"
  # end

end