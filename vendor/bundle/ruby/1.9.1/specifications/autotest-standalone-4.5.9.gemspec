# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "autotest-standalone"
  s.version = "4.5.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Davis", "Michael Grosser"]
  s.date = "2011-12-15"
  s.executables = ["autotest", "unit_diff"]
  s.files = ["bin/autotest", "bin/unit_diff"]
  s.homepage = "http://github.com/grosser/autotest"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Autotest, without ZenTest"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
