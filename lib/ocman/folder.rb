module Ocman
  class Folder
    def self.create_folder(path)
      Ocman::Dav.new.mkdir(path)
    end

    def self.list(path)
      Ocman::Dav.new.ls(path)
    end
  end
end
