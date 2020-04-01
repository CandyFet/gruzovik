module Sluggable
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true
    validates :slug, uniqueness: { case_sensitive: false }

    before_validation :check_slug
  end

  def to_param
    slug
  end

  private

  def check_slug
    record_id = new_record? ? (self.class.unscoped.order(:id).last.try(:id).presence || 0) + 1 : id
    record_name = self.class.where(slug: name.to_s.parameterize).any? ? "#{name.to_s.parameterize}-#{record_id}" : name.to_s.parameterize
    self.slug = slug.blank? ? record_name : slug.parameterize
  end
end
