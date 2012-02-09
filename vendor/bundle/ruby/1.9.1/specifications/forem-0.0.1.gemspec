# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "forem"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = "2011-03-02"
  s.description = "The best Rails 3 forum engine in the world."
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "The best Rails 3 forum engine in the world."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.5"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<simple_form>, [">= 0"])
    else
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.5"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<simple_form>, [">= 0"])
    end
  else
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.5"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<simple_form>, [">= 0"])
  end
end
