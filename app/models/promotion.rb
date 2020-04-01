class Promotion < ActiveRecord::Base
  default_scope -> { order(published_at: :desc) }

  mount_uploader :image, PromotionUploader

  validates :name, presence: true
  validates :published_at, presence: true

  after_initialize :set_published_date

  private

  def set_published_date
    self.published_at = DateTime.now unless published_at?
  end
end
