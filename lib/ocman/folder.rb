# frozen_string_literal: true

require 'hashie'
require 'cgi'
require 'erb'

module Ocman
  class Folder
    class << self
      def create(path)
        Ocman::Dav.new.mkdir(escape_path(path))
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
    end
  end
end
