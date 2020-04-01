# -*- encoding: utf-8 -*-
# stub: rails_admin_nestable 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_admin_nestable"
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrea Dal Ponte"]
  s.date = "2015-05-23"
  s.description = "RailsAdmin Drag and drop tree view for Ancestry gem with ActiveRecord and MongoID"
  s.email = ["info@andreadalponte.com"]
  s.homepage = "https://github.com/dalpo/rails_admin_nestable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "RailsAdmin Drag and drop tree view for Ancestry gem"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails_admin>, [">= 0.6.6"])
      s.add_runtime_dependency(%q<haml-rails>, [">= 0"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 0"])
      s.add_runtime_dependency(%q<sass-rails>, [">= 0"])
    else
      s.add_dependency(%q<rails_admin>, [">= 0.6.6"])
      s.add_dependency(%q<haml-rails>, [">= 0"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<sass-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails_admin>, [">= 0.6.6"])
    s.add_dependency(%q<haml-rails>, [">= 0"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<sass-rails>, [">= 0"])
  end
end
