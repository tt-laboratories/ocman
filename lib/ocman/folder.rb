# frozen_string_literal: true

require 'hashie'
require 'cgi'
require 'erb'

module Ocman
  class Folder
    class << self
      def create_recursive(path)
        path_list(path).each do |path_part|
          next if ignore404 { list(path_part) }

          create(path_part)
        end
      end

      def create(path)
        Ocman::Dav.new.mkdir(escape_path(path))
        wait_for_folder(path)
      end

      def list(path, options = {})
        accu = []

        Ocman::Dav.new.ls(escape_path(path), options) do |item|
          accu << Hashie::Mash.new(
            path: CGI.unescape(item.uri.to_s.gsub(Ocman::Dav.url(path), '').gsub('/', '')),
            type: item.type.to_s,
            size: item.size
          )
        end

        accu
      end

      private

        def escape_path(path)
          path.split('/').map { |segment| ERB::Util.url_encode(segment) }.join('/')
        end

        def wait_for_folder(path)
          wait_time = 1
          retries = 0
          loop do
            raise TimeoutError if retries >= 3
            break if Ocman.list(path)

            sleep wait_time
            wait_time *= 2
            retries += 1
          end
        end

        def ignore404
          yield
        rescue Net::HTTPServerException => e
          raise unless e.to_s.match?(/404.*Not found/i)

          nil
        end

        def path_list(path)
          path.split('/').reduce([]) do |acc, segment|
            acc << [acc.last, segment].compact.join('/')
          end
        end
    end
  end
end
