source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rake', '0.9.2'
gem 'sqlite3', :group => [:development, :test]
gem "will_paginate", "~> 3.0.2"
gem "wmd-rails", "~> 0.0.3"
gem "rdiscount", :require => 'rdiscount'
gem "cancan"
gem "paperclip"
gem "high_voltage"
gem 'pdfkit'
gem 'jquery-rails', '>= 0.2.6'
gem "formtastic"
gem "clearance", "~> 0.14.0"
gem "capistrano"
gem "truncate_html"
gem "forem"


# Use unicorn as the web server
# gem 'unicorn'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

group :development do
  gem 'rspec-rails', '2.8.1'
  gem 'faker', '0.3.1'
  gem 'webrat', '0.7.1'
end

group :test do
  gem 'rspec', '2.8.0'
  gem 'rspec-rails', '2.8.1'
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

group :assets do
  gem 'sass-rails', " ~> 3.1.0"
  #gem 'coffee-rails', " ~> 3.1.0"
  #gem 'uglifier'
end
