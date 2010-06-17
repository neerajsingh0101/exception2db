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
        <line number="1331" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="perform_action_without_filters"/>
        <line number="617" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/filters.rb" method="call_filters"/>
        <line number="610" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/filters.rb" method="perform_action_without_benchmark"/>
        <line number="68" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/benchmarking.rb" method="perform_action_without_rescue"/>
        <line number="17" file="[GEM_ROOT]/gems/activesupport-2.3.5/lib/active_support/core_ext/benchmark.rb" method="ms"/>
        <line number="308" file="/usr/local/lib/ruby/1.8/benchmark.rb" method="realtime"/>
        <line number="17" file="[GEM_ROOT]/gems/activesupport-2.3.5/lib/active_support/core_ext/benchmark.rb" method="ms"/>
        <line number="68" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/benchmarking.rb" method="perform_action_without_rescue"/>
        <line number="160" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/rescue.rb" method="perform_action_without_flash"/>
        <line number="146" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/flash.rb" method="perform_action"/>
        <line number="532" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="send"/>
        <line number="532" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="process_without_filters"/>
        <line number="606" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/filters.rb" method="process"/>
        <line number="391" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="process"/>
        <line number="386" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb" method="call"/>
        <line number="437" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/routing/route_set.rb" method="call"/>
        <line number="87" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/dispatcher.rb" method="dispatch"/>
        <line number="121" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/dispatcher.rb" method="_call"/>
        <line number="130" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/dispatcher.rb" method="build_middleware_stack"/>
        <line number="29" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/query_cache.rb" method="call"/>
        <line number="29" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/query_cache.rb" method="call"/>
        <line number="34" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/connection_adapters/abstract/query_cache.rb" method="cache"/>
        <line number="9" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/query_cache.rb" method="cache"/>
        <line number="28" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/query_cache.rb" method="call"/>
        <line number="361" file="[GEM_ROOT]/gems/activerecord-2.3.5/lib/active_record/connection_adapters/abstract/connection_pool.rb" method="call"/>
        <line number="25" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/string_coercion.rb" method="call"/>
        <line number="9" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/head.rb" method="call"/>
        <line number="24" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/methodoverride.rb" method="call"/>
        <line number="15" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/params_parser.rb" method="call"/>
        <line number="93" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/session/cookie_store.rb" method="call"/>
        <line number="26" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/failsafe.rb" method="call"/>
        <line number="11" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/lock.rb" method="call"/>
        <line number="11" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/lock.rb" method="synchronize"/>
        <line number="11" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/lock.rb" method="call"/>
        <line number="106" file="[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/dispatcher.rb" method="call"/>
        <line number="31" file="[GEM_ROOT]/gems/rails-2.3.5/lib/rails/rack/static.rb" method="call"/>
        <line number="46" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/urlmap.rb" method="call"/>
        <line number="40" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/urlmap.rb" method="each"/>
        <line number="40" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/urlmap.rb" method="call"/>
        <line number="17" file="[GEM_ROOT]/gems/rails-2.3.5/lib/rails/rack/log_tailer.rb" method="call"/>
        <line number="13" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/content_length.rb" method="call"/>
        <line number="15" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/chunked.rb" method="call"/>
        <line number="64" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/handler/mongrel.rb" method="process"/>
        <line number="159" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="process_client"/>
        <line number="158" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="each"/>
        <line number="158" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="process_client"/>
        <line number="285" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="run"/>
        <line number="285" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="initialize"/>
        <line number="285" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="new"/>
        <line number="285" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="run"/>
        <line number="268" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="initialize"/>
        <line number="268" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="new"/>
        <line number="268" file="[GEM_ROOT]/gems/mongrel-1.1.5/lib/mongrel.rb" method="run"/>
        <line number="34" file="[GEM_ROOT]/gems/rack-1.0.1/lib/rack/handler/mongrel.rb" method="run"/>
        <line number="111" file="[GEM_ROOT]/gems/rails-2.3.5/lib/commands/server.rb" method=""/>
        <line number="31" file="/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb" method="gem_original_require"/>
        <line number="31" file="/usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb" method="require"/>
        <line number="3" file="script/server" method=""/>
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
