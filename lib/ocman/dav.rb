require 'net/dav'

module Ocman
  class Dav
    attr_writer :connection

    def mkdir(path)
      connection.mkdir(dav_base_uri + path)
    end

    def ls(path)
      accu = []

      connection.find(dav_base_uri + path) do |item|
        accu << item_hash(item)
      end

      accu
    end

    private

      def item_hash(item)
        {
          path: item.uri.path.gsub(dav_base_uri, '/'),
          type: item.type,
          size: item.size
        }
      end

      def dav_base_uri
        '/remote.php/webdav/'
      end

      def connection
        @connection ||= establish_connection
      end

      def establish_connection
        dav = Net::DAV.new(Ocman.configuration.base_url)
        dav.verify_server = true
        dav.credentials(Ocman.configuration.user_name, Ocman.configuration.password)
        dav
      end
  end
end
