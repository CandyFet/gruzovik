class NewsImage < ActiveRecord::Base
  belongs_to :news

  mount_uploader :file, NewsImageUploader

  validates :file, presence: true
end
