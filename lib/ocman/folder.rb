require 'hashie'

module Ocman
  class Folder
    def self.create(path)
      Ocman::Dav.new.mkdir(path)
    end

    def self.list(path)
      accu = []

      Ocman::Dav.new.ls(path) do |item|
        accu << Hashie::Mash.new({
          path: item.uri.to_s.gsub(Ocman::Dav.url(path), '').gsub('/', ''),
          type: item.type.to_s,
          size: item.size
        })
      end

      accu
    end
  end
end
