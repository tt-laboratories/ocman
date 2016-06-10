module Ocman
  class Folder
    def self.create_folder(path)
      Ocman::Dav.new.mkdir(path)
    end
  end
end
