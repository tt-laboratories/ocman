require 'net/dav'

module Ocman
  class Dav
    attr_writer :connection

    def mkdir(path)
      connection.mkdir( uri(path) )
    end

    def ls(path)
      accu = []

      connection.find( uri(path) ) do |item|
        accu << item_hash(item)
      end

      accu
    end

    def put(file_path, path)
      puts uri(path, File.basename(file_path))
      File.open(file_path, 'r') do |stream|
        connection.put( uri(path, File.basename(file_path)) , stream, File.size(file_path))
      end
    end

    private

      def item_hash(item)
        {
          path: item.uri.path.gsub(dav_base_uri, '/'),
          type: item.type,
          size: item.size
        }
      end

      def uri(path, filename=nil)
        [dav_base_uri, path, filename].compact.join('/').gsub(/\/+/, '/')
      end

      def dav_base_uri
        Ocman.configuration.dav_base_uri || '/remote.php/webdav/'
      end

      def connection
        dav = Net::DAV.new(Ocman.configuration.base_url)
        dav.verify_server = true
        dav.credentials(Ocman.configuration.user_name, Ocman.configuration.password)
        dav
      end
  end
end
