require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'spec/spec_helper'

vendored_cucumber_bin = Dir["./cucumber*/bin/cucumber"].first
$LOAD_PATH.unshift(File.dirname(vendored_cucumber_bin) + '/../lib') unless vendored_cucumber_bin.nil?

namespace :raj do
task:bullshit do
end
end

begin
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new({:ok => 'raj:bullshit'}, 'Run features that should pass') do |t|
      t.binary = vendored_cucumber_bin # If nil, the gem's binary is used.
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'default'
    end

    Cucumber::Rake::Task.new({:wip => 'db:test:prepare'}, 'Run features that are being worked on') do |t|
      t.binary = vendored_cucumber_bin
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'wip'
    end

    desc 'Run all features'
    task :all => [:ok, :wip]
  end
  desc 'Alias for cucumber:ok'
  task :cucumber => 'cucumber:ok'

  task :default => :cucumber

  task :features => :cucumber do
    STDERR.puts "*** The 'features' task is deprecated. See rake -T cucumber ***"
  end
rescue LoadError
  desc 'cucumber rake task not available (cucumber not installed)'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
