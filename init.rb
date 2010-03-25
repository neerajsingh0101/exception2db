def load_will_paginate
  begin 
    require 'will_paginate'
  rescue LoadError => e
    $stderr.puts %{
      ************************************************
      * gem will_paginate is missing                 *
      * plugin exception2db depends on will_paginate *
      * Please install will_paginate by executing    *
      * sudo gem install will_paginate               *
      ************************************************
    }
  end
end

load_will_paginate

require File.join(RAILS_ROOT,'vendor', 'plugins', 'exception2db', 'lib', 'exception2db', 'config.rb')
Exception2dbConfig.initialize_defaults

require File.join(RAILS_ROOT,'vendor', 'plugins', 'exception2db', 'lib', 'exception2db', 'util.rb')

require 'rexml/document'
