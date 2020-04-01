class Typeauto < ActiveRecord::Base
  default_scope -> { order(:position) }

  self.table_name = 'typeauto'

  has_many :models, dependent: :destroy, foreign_key: :TYPEAUTO, primary_key: :sort

  validates :name, presence: true

  def marks
    Mark.joins(:models).where(models: {ID: models.ids}).distinct
  end
end