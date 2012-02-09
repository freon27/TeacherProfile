# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "clearance"
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Croak", "Mike Burns", "Jason Morrison", "Joe Ferris", "Eugene Bolshakov", "Nick Quaranto", "Josh Nichols", "Mike Breen", "Jon Yurek", "Chad Pytel"]
  s.date = "2012-01-13"
  s.description = "Rails authentication & authorization with email & password."
  s.email = "support@thoughtbot.com"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/thoughtbot/clearance"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Rails authentication & authorization with email & password."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<diesel>, ["~> 0.1.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.3.8"])
      s.add_development_dependency(%q<cucumber-rails>, ["~> 1.0.2"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.6.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<diesel>, ["~> 0.1.5"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<appraisal>, ["~> 0.3.8"])
      s.add_dependency(%q<cucumber-rails>, ["~> 1.0.2"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.6.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<diesel>, ["~> 0.1.5"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<appraisal>, ["~> 0.3.8"])
    s.add_dependency(%q<cucumber-rails>, ["~> 1.0.2"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.6.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end
