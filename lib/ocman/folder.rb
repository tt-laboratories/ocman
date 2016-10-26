require 'hashie'

module Ocman
  class Folder
    def self.create(path)
      Ocman::Dav.new.mkdir(URI.encode(path))
    end

    def self.list(path, options={})
      accu = []

      Ocman::Dav.new.ls(URI.encode(path), options) do |item|
        accu << Hashie::Mash.new({
          path: URI.decode(item.uri.to_s.gsub(Ocman::Dav.url(path), '').gsub('/', '')),
          type: item.type.to_s,
          size: item.size
        })
      end

      accu
    end
  end
end
