ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'
require 'rexml/document'

gem 'rspec', '= 1.3.0'
require 'spec'
 
pwd = File.dirname(__FILE__)
$: << pwd + '/../lib' << pwd

ENV['RAILS_ENV'] = 'test'

rails_root = File.join(pwd, '..', 'test', 'rails_root')


# start rails
require "#{rails_root}/config/environment"

# spec/rails must be loaded after rails is loaded
require 'spec/rails'

Dir[File.join(pwd, '..', 'app', 'models', '*.rb')].each {|f| require f}

# require all the lib files plugin needs
Dir[File.join(pwd, '..', 'lib', '**', '*.rb')].each {|f| require f}

# initialize defaults
# TODO Change the name to Exception2db::Config
Exception2dbConfig.initialize_defaults

# require all the controllers plugin needs
Dir[File.join(pwd, '..', 'app', 'controllers', 'exception2db', '*.rb')].each {|f| require f}

# require plugin routes
require "#{rails_root}/../../config/routes.rb"

require 'test/unit'
require 'test_help'
silence_warnings { RAILS_ENV = ENV['RAILS_ENV'] }

# Run migrations
ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate("#{rails_root}/db/migrate")

gem 'shoulda', '= 2.10.2'
require 'shoulda'

gem 'will_paginate', '= 2.3.11'
require 'will_paginate'

gem 'factory_girl', '= 1.2.4'
require 'factory_girl'

gem 'flexmock', '= 0.8.6'
require 'flexmock'

gem 'redgreen', '= 1.2.2'
require 'RedGreen'

gem 'cucumber', '= 0.7.2'
require 'cucumber'

# for helper tests
require 'action_view/test_case'

Dir[File.join(pwd, 'factories', '*.rb')].each { |f| require File.expand_path(f) }


class ActiveSupport::TestCase

  def revoke_read_only_access
    AdminDataConfig.set = ({:is_allowed_to_view => Proc.new { |controller| false } })
  end

  def grant_read_only_access
    AdminDataConfig.set = ({:is_allowed_to_view => Proc.new { |controller| true } })
  end

  def grant_update_access
    AdminDataConfig.set = ({:is_allowed_to_update => Proc.new { |controller| true } })
  end

  def revoke_update_access
    AdminDataConfig.set = ({:is_allowed_to_update => Proc.new { |controller| false } })
  end

  def show_response
    Dir.mkdir(File.join(RAILS_ROOT, 'tmp')) unless File.directory?(File.join(RAILS_ROOT,'tmp'))
    response_html = File.join(RAILS_ROOT, 'tmp', 'response.html')
    File.open(response_html, 'w') { |f| f.write(@response.body) }
    system 'open ' + File.expand_path(response_html) rescue nil
  end

end



$exception_data_xml = %Q{
<?xml version="1.0" encoding="UTF-8"?>
<notice version="2.0">
  <api-key></api-key>
  <notifier>
    <name>Hoptoad Notifier</name>
    <version>2.2.2</version>
    <url>http://hoptoadapp.com</url>
    </notifier>
    <error>
      <class>RuntimeError</class>
      <message>RuntimeError: 46</message>
      <backtrace>
        <line number="10" file="[PROJECT_ROOT]/vendor/plugins/exception2db/app/controllers/exception2db/main_controller.rb" method="index"/>
        <line number="1331" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="send"/>
      </backtrace>
    </error>
    <request>
      <url>http://localhost:3000/exception2db</url>
      <component>exception2db/main</component>
      <action>index</action>
      <params>
        <var key="action">index</var>
        <var key="controller">exception2db/main</var>
      </params>
      <cgi-data>
        <var key="HTTP_ACCEPT">application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5</var>
        <var key="rack.session"></var>
        <var key="SERVER_NAME">localhost</var>
        <var key="HTTP_HOST">localhost:3000</var>
        <var key="rack.url_scheme">http</var>
        <var key="HTTP_USER_AGENT">Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.38 Safari/533.4</var>
        <var key="REQUEST_PATH">/exception2db</var>
        <var key="rack.errors">#&lt;IO:0x1001acb78&gt;</var>
        <var key="SERVER_PROTOCOL">HTTP/1.1</var>
        <var key="action_controller.request.request_parameters"></var>
        <var key="HTTP_ACCEPT_LANGUAGE">en-US,en;q=0.8</var>
        <var key="rack.run_once">false</var>
        <var key="PATH_INFO">/exception2db</var>
        <var key="REMOTE_ADDR">127.0.0.1</var>
        <var key="SERVER_SOFTWARE">Mongrel 1.1.5</var>
        <var key="rack.version">10</var>
        <var key="SCRIPT_NAME"></var>
        <var key="HTTP_VERSION">HTTP/1.1</var>
        <var key="HTTP_COOKIE">_app_demo_session=BAh7BzoQX2NzcmZfdG9rZW4iMVVaUWdTdGhjWVg5MEVxSlJlaUFZNUhsRHlJaU11RjlSRWVrQ1VjbDdVV3M9Og9zZXNzaW9uX2lkIiVmY2M4Nzk2YWM2MzMwMGE2Zjc5YzgwNGJlNjVmNThiMQ%3D%3D--c3e438e8b20cbc2c650cc40d92101f30e23070b8; _exception2db_demo_session=BAh7BjoPc2Vzc2lvbl9pZCIlODc1NDJmZTNlMTg4YTc4NzMwNTY2YTU5Mjc3NjE3Nzg%3D--ad4cf6bade36ccd02b6c07f2e20839e211b81f5a</var>
        <var key="rack.multithread">false</var>
        <var key="rack.multiprocess">false</var>
        <var key="action_controller.request.path_parameters">
          <var key="action">index</var>
          <var key="controller">exception2db/main</var>
        </var>
        <var key="REQUEST_URI">/exception2db</var>
        <var key="SERVER_PORT">3000</var>
        <var key="rack.request.query_hash"></var>
        <var key="HTTP_ACCEPT_CHARSET">ISO-8859-1,utf-8;q=0.7,*;q=0.3</var><var key="rack.session.options"><var key="path">/</var>
        <var key="domain"></var><var key="expire_after"></var>
        <var key="httponly">true</var>
        <var key="key">_session_id</var></var>
        <var key="REQUEST_METHOD">GET</var>
        <var key="action_controller.request.query_parameters"></var>
        <var key="action_controller.rescue.request">#&lt;ActionController::Request:0x103192518&gt;</var>
        <var key="QUERY_STRING"></var>
        <var key="HTTP_CONNECTION">keep-alive</var>
        <var key="GATEWAY_INTERFACE">CGI/1.2</var>
        <var key="rack.request.query_string"></var>
        <var key="action_controller.rescue.response">#&lt;ActionController::Response:0x1031924c8&gt;</var>
        <var key="HTTP_ACCEPT_ENCODING">gzip,deflate</var>
        <var key="rack.input">#&lt;StringIO:0x1031a6270&gt;</var>
      </cgi-data>
    </request>
    <server-environment>
      <project-root>/Users/neerajdotname/dev/working/exception2db_demo</project-root>
      <environment-name>production</environment-name>
    </server-environment>
  </notice>
}

