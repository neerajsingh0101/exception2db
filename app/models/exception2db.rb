class Exception2db < ActiveRecord::Base

  validates_presence_of :exception

  def document
    @document ||= REXML::Document.new(self.exception)
  end

  def error_message
    REXML::XPath.first(document, '//notice/error/message/text()').to_s
  end

  def cgi_data
    {}.tap { |e| REXML::XPath.each(document, '//notice/request/cgi-data/var') { |node| e.store(node.attributes['key'].to_s, node.text) } }
  end

  def user_agent
    node = REXML::XPath.first(document, '//notice/request/cgi-data/var[@key="HTTP_USER_AGENT"]')
    node.blank? ? "N/A" : node.text
  end

  def parameters
    output = [].tap{ |e|
      REXML::XPath.each(document, '//notice/request/params/var') do |node|
        item = ':' + node.attributes['key'].to_s
        item << ' => '
        item << (node.text || '')
        e << item
      end
    }.join(' , ')

    '{ ' + output + ' }'
  end

  def controller
    REXML::XPath.first(document, '//notice/request/component/text()').to_s
  end

  def action
    REXML::XPath.first(document, '//notice/request/action/text()').to_s
  end

  def url
    REXML::XPath.first(document, '//notice/request/url/text()').to_s
  end

  def environment
    REXML::XPath.first(document, '//notice/server-environment/environment-name/text()').to_s
  end

  def top_file_and_line_number
    top_file = REXML::XPath.match(document, '//notice/error/backtrace/line').first
    "#{top_file.attributes['file']}:#{top_file.attributes['number']}"
  end

  def formatted_backtrace
    REXML::XPath.match(document, '//notice/error/backtrace/line').inject('') do |sum, elem|
      sum << '<p>'
      sum << elem.attributes['file']
      sum << ':'
      sum << elem.attributes['number']
      sum << ':in '
      sum << elem.attributes['method']
      sum << '</p>'
    end
  end
end
