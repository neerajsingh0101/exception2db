class Exception2db::Util

  def self.stylesheet_link_tag(*args)
    data = args.inject('') do |sum, arg|
      sum << File.new(File.join(::Exception2dbConfig.setting[:plugin_dir], 'lib', 'css', "#{arg}.css")).read
    end
    ["<style type='text/css'>", data, '</style>'].join
  end

  def self.javascript_include_tag(*args)
    data = args.inject('') do |sum, arg|
      sum << File.new(File.join(Exception2dbConfig.setting[:plugin_dir], 'lib', 'js', "#{arg}.js")).read
    end
    ['<script type="text/javascript">', data, '</script>'].join
  end

end
