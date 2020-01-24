# frozen_string_literal: true

require 'ocman/configuration'
require 'ocman/dav'
require 'ocman/item'
require 'ocman/folder'
require 'ocman/version'
require 'ocman/share'

module Ocman
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Ocman::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  ### share
  def self.share(path, user)
    Ocman::Share.new(path).share(user)
  end

  def self.delete_share(path, user)
    Ocman::Share.new(path).delete_share(user)
  end

  ### folder
  def self.list(path, options = {})
    Ocman::Folder.list(path, options)
  end

  def self.create_folder(path)
    Ocman::Folder.create(path)
  end

  ### files
  def self.put(file_path, path, options = {})
    Ocman::Item.create(file_path, path, options)
  end

  def self.delete(path)
    Ocman::Item.delete(path)
  end

  def self.move(source_path, destination_path)
    Ocman::Item.move(source_path, destination_path)
  end
end
