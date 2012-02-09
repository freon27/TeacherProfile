# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "autotest-notification"
  s.version = "2.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando"]
  s.date = "2011-07-18"
  s.description = "This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results."
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install", "an-uninstall", "playsound"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "website/index.txt"]
  s.files = ["bin/an-install", "bin/an-uninstall", "bin/playsound", "History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "website/index.txt"]
  s.homepage = "http://github.com/carlosbrando/autotest-notification/"
  s.post_install_message = "PostInstall.txt"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "autotest-notification"
  s.rubygems_version = "1.8.15"
  s.summary = "This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<autotest-standalone>, ["~> 4.5"])
    else
      s.add_dependency(%q<autotest-standalone>, ["~> 4.5"])
    end
  else
    s.add_dependency(%q<autotest-standalone>, ["~> 4.5"])
  end
end
