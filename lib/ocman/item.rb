module Ocman
  class Item
    def self.create(file, path)
      Ocman::Dav.new.put(file, path)
    end
  end
end
