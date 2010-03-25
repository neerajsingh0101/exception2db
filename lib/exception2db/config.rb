class Exception2dbConfig

  cattr_accessor :setting

  def self.set=(input = {})
    valid_keys = %w(is_allowed_to_view).collect(&:intern)
    extra_keys = input.keys - valid_keys
    raise "Following options are not supported. #{extra_keys.inspect}" unless extra_keys.blank?
    self.setting ||= {}
    self.setting.merge!(input)
  end

  def self.initialize_defaults
    self.setting = {
      :plugin_dir => File.expand_path(File.join(File.dirname(__FILE__), '..', '..')),
      :will_paginate_per_page => 50,
      :is_allowed_to_view => lambda { |controller| return true if Rails.env.development? }
    }
  end


end
