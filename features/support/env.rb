require 'rubygems'
require 'rexml/document'

root_dir = File.join(File.dirname(__FILE__), '..', '..')
rails_root = File.join(root_dir, 'test', 'rails_root')

# load rails
require "#{rails_root}/config/environment"

# spec/rails must be loaded after rails is loaded
require 'spec/rails'

# load all the models
Dir[File.join(root_dir, 'app', 'models', '*.rb')].each {|f| require f}

# load all the controllers
Dir[File.join(root_dir, 'app', 'controllers', 'exception2db', '*.rb')].each {|f| require f}

# load all the lib files
Dir[File.join(root_dir, 'lib', '**', '*.rb')].each {|f| require f}

# initialize defaults
# TODO Change the name to Exception2db::Config
Exception2dbConfig.initialize_defaults

require 'test/unit'
require 'test_help'
silence_warnings { RAILS_ENV = ENV['RAILS_ENV'] }

# Run migrations
ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate("#{rails_root}/db/migrate")

gem 'shoulda', '= 2.10.2'
require 'shoulda'

gem 'will_paginate', '= 2.3.12'
require 'will_paginate'

gem 'factory_girl', '= 1.2.4'
require 'factory_girl'

gem 'flexmock', '= 0.8.6'
require 'flexmock'

gem 'redgreen', '= 1.2.2'
require 'RedGreen'

gem 'cucumber', '= 0.8.5'
require 'cucumber'

gem 'spork', '= 0.8.3'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "cucumber"
  require "#{rails_root}/config/environment"
  require "#{rails_root}/../../config/routes.rb"

  require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
  require 'cucumber/rails/world'
  require 'cucumber/rails/active_record'
  require 'cucumber/web/tableish'

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'
  require 'cucumber/rails/capybara_javascript_emulation'
  Capybara.default_selector = :css
end

Spork.each_run do
  ActionController::Base.allow_rescue = false
  Cucumber::Rails::World.use_transactional_fixtures = true
  if defined?(ActiveRecord::Base)
    begin
      require 'database_cleaner'
      DatabaseCleaner.strategy = :truncation
    rescue LoadError => ignore_if_database_cleaner_not_present
    end
  end
end

# add views to the path to look for views
Exception2db::MainController.prepend_view_path(File.join(root_dir, 'app', 'views'))

# for helper tests
require 'action_view/test_case'

Dir[File.join(root_dir, 'test', 'factories', '*.rb')].each { |f| require File.expand_path(f) }

require "#{root_dir}/test/error_xml"
