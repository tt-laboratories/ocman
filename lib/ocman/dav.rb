require 'net/dav'

module Ocman
  class Dav
    attr_writer :connection

    def initialize
    end

    def mkdir(path)
      connection.mkdir(dav_base_uri + path)
    end

    private

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
