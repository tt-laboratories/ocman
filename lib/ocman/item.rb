# frozen_string_literal: true

module Ocman
  class Item
    def self.create(file, path, options = {})
      Ocman::Dav.new.put(file, CGI.escape(path), options)
    end

    def self.delete(path)
      Ocman::Dav.new.delete(CGI.escape(path))
    end

    def self.move(source_path, destination_path)
      Ocman::Dav.new.move(CGI.escape(source_path), CGI.escape(destination_path))
    end
  end
end
