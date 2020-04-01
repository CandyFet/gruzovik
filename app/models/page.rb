class Page < ActiveRecord::Base
  mount_uploader :image, PageUploader

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(is_page: true) }

  def self.get_content(s)
    find_by(slug: s).try(:content)
  end
end
