class MainText < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  def self.get_name(s)
    find_by(slug: s).try(:name)
  end

  def self.get_content(s, sanitize=false)
    if sanitize
      ActionController::Base.helpers.strip_tags(find_by(slug: s).try(:content)).try(:strip)
    else
      find_by(slug: s).try(:content)
    end
  end

  def self.has_content?(s)
    find_by(slug: s).try(:content).present?
  end
end
