# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "wmd-rails"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rei"]
  s.date = "2011-12-03"
  s.description = "WMDEditor for rails 3.1"
  s.email = ["chloerei@gmail.com"]
  s.homepage = "https://github.com/chloerei/wmd-rails"
  s.require_paths = [["lib"]]
  s.rubygems_version = "1.8.15"
  s.summary = "WMDEditor for rails 3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1.1"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1.1"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1.1"])
  end
end
