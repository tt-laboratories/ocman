require 'ocman/configuration'
require 'ocman/dav'
require 'ocman/folder'
require 'ocman/version'
require 'ocman/share'

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

  def self.share(patch, user)
    Share.new(patch).share(user)
  end

  def self.delete_share(patch, user)
    Share.new(patch).delete_share(user)
  end
end
