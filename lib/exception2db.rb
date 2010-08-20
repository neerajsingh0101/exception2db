begin
  require 'will_paginate'
rescue LoadError => e
  $stderr.puts %(
  *************************************************************************************************
  * gem will_paginate is missing                                                                  *
  *************************************************************************************************
  )
end

if Rails.version >= '3.0'
  require 'admin_data/railtie'
else
  raise "Please see documentation at http://github.com/neerajdotname/exception2db to find out how to use this gem with rails 2.3.x"
end

require 'exception2db/config.rb'
require 'exception2db/util.rb'
require 'rexml/document'

Exception2db::Config.initialize_defaults
