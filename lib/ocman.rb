require 'ocman/configuration'
require 'ocman/dav'
require 'ocman/folder'
require 'ocman/version'

module Ocman
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
