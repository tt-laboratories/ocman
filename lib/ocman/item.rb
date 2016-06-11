module Ocman
  class Item
    def self.create(file, path)
      Ocman::Dav.new.put(file, path)
    end

    def self.delete(path)
      Ocman::Dav.new.delete(path)
    end
  end
end
