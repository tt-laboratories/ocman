# frozen_string_literal: true

module Ocman
  class Item
    def self.create(file, path, options = {})
      Ocman::Dav.new.put(file, escape_path(path), options)
    end

    def self.delete(path)
      Ocman::Dav.new.delete(escape_path(path))
    end

    def self.move(source_path, destination_path)
      Ocman::Dav.new.move(escape_path(source_path), escape_path(destination_path))
    end

    def self.escape_path(path)
      path.split('/').map { |segment| ERB::Util.url_encode(segment) }.join('/')
    end
  end
end
