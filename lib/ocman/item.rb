module Ocman
  class Item
    def self.create(file, path, options={})
      Ocman::Dav.new.put(file, path, options)
    end

    def self.delete(path)
      Ocman::Dav.new.delete(path)
    end

    def self.move(source_path, destination_path)
      Ocman::Dav.new.move(source_path, destination_path)
    end
  end
end
