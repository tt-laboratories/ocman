require 'net/dav'

module Ocman
  class Dav
    attr_writer :connection

    def mkdir(path)
      connection.mkdir( uri(path) )
    end

    def ls(path)
      connection.find( uri(path) ) do |item|
        yield(item)
      end
    end

    def put(file_path, path)
      File.open(file_path, 'r') do |stream|
        connection.put( uri(path, File.basename(file_path)) , stream, File.size(file_path))
      end
    end

    def delete(path)
      connection.delete( uri(path) )
    end

    def move(source_path, destination_path)
      connection.move( uri(source_path), uri(destination_path) )
    end

    def self.base_uri
      Ocman.configuration.dav_base_uri || '/remote.php/webdav/'
    end

    def self.url(path)
      Ocman.configuration.base_url + (Ocman::Dav.base_uri + path).gsub(/\/+/, '/')
    end

    private

      def item_hash(item)
        {
          path: item.uri.path.gsub(Ocman::Dav.base_uri, '/'),
          type: item.type,
          size: item.size
        }
      end

      def uri(path, filename=nil)
        [Ocman::Dav.base_uri, path, filename].compact.join('/').gsub(/\/+/, '/')
      end

      def connection
        dav = Net::DAV.new(Ocman.configuration.base_url)
        dav.verify_server = true
        dav.credentials(Ocman.configuration.user_name, Ocman.configuration.password)
        dav
      end
  end
end
