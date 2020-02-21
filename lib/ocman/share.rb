# frozen_string_literal: true

require 'multi_json'
require 'restclient'
require 'hashie'

module Ocman
  class Share
    def initialize(path)
      @path = path
    end

    def share(user, permission = Permission.all)
      request_parameter = {
        payload: {
          path: @path,
          shareWith: user,
          shareType: '0',
          permissions: permission.to_i
        }
      }.merge connection_params('post')

      request = RestClient::Request.new(request_parameter)
      parse_result(request.execute)
    end

    def delete_share(user)
      share = find_share(user)
      return if share.nil?

      request = RestClient::Request.new(connection_params('delete', id: share.id))
      parse_result(request.execute)
    end

    def find_share(user)
      Array(share_info.data).find do |share|
        share.share_with == user
      end
    end

    def share_info
      request = RestClient::Request.new(connection_params('get', path: @path))
      parse_result(request.execute)
    end

    private

      def parse_result(response)
        Hashie::Mash.new(MultiJson.load(response)['ocs'])
      end

      def connection_params(http_method, attributes = {})
        {
          url: share_url(attributes[:id]),
          method: http_method,
          user: Ocman.configuration.user_name,
          password: Ocman.configuration.password,
          headers: connection_headers(attributes)
        }
      end

      def connection_headers(attributes = {})
        {
          'OCS-APIRequest' => true,
          params: {
            path: attributes[:path],
            format: 'json'
          }.reject { |_key, value| value.nil? }
        }
      end

      def share_url(id = nil)
        Ocman.configuration.base_url + '/ocs/v1.php/apps/files_sharing/api/v1/shares' + ('/' + id.to_s if id).to_s
      end
  end
end
