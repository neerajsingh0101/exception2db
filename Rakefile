require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test exception2db gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for exception2db gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'exception2db'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.textile')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  require './lib/exception2db/version'
  Jeweler::Tasks.new do |s|
    s.name = "exception2db"
    s.version = Exception2db::VERSION
    s.summary = s.description = "Store exceptions in local datbase using Hoptoad API"
    s.email = "neerajdotname@gmail.com"
    s.homepage = "http://github.com/neerajdotname/exception2db"
    s.authors = ['Neeraj Singh']
    s.files = FileList["[A-Z]*", "{app,config,lib,test}/**/*", 'init.rb']

    s.add_dependency('will_paginate', '>= 3.0.pre2')
    s.add_dependency('hoptoad_notifier', '>= 2.3.5')

    s.add_development_dependency 'flexmock', '>= 0.8.7'
    s.add_development_dependency 'shoulda', '>= 2.11.3'
    s.add_development_dependency 'factory_girl_rails'
    s.add_development_dependency 'nokogiri', '>= 1.4.3.1'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError => le
  puts "Jeweler not available. Install it for jeweler-related tasks with: gem install jeweler: #{le.message}"
end

