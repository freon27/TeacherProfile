source 'http://rubygems.org'

gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rake', '0.9.2'
gem 'sqlite3-ruby', :require => 'sqlite3', :group => [:development, :test]
gem 'will_paginate', '3.0.pre2'
gem "rdiscount", :require => 'rdiscount'
gem "cancan"
gem "paperclip"
gem "high_voltage"
gem 'pdfkit'
gem 'jquery-rails', '>= 0.2.6'
gem "formtastic"
gem "clearance", "~> 0.10.3.2"
gem "capistrano"
gem "truncate_html"


#rance", "~> 0.10.1"
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

group :development do
  gem 'rspec-rails', '2.3.0'
  gem 'faker', '0.3.1'
  gem 'webrat', '0.7.1'
end

group :test do
  gem 'rspec', '2.3.0'
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails'
  gem 'ZenTest'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'autotest-notification'
  gem 'timecop'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'spork'
  gem 'launchy'
	gem 'pickle'
	gem 'simplecov'
end

group :production do
  gem "mysql"
end
