require 'json'
require 'restclient'
require 'hashie'

module Ocman
  class Share
    def initialize(path)
      @path = path
    end

    def share(user)
      request_parameter = {
        payload:  {
          path: @path,
          shareWith: user,
          shareType: '0',
          permissions: '31',
        },
      }.merge connection_params('post')

      request = RestClient::Request.new( request_parameter )
      parse_result( request.execute )
    end

    def delete_share(user)
      share = find_share(user)
      request = RestClient::Request.new( connection_params('delete', id: share.id) )
      parse_result( request.execute )
    end

    def find_share(user)
      result = nil
      shares = share_info.data
      shares = [shares] unless shares.kind_of?(Array)
      shares.each do |share|
        if share.share_with == user
          result = share
        end
      end
      result
    end

    def share_info
      request = RestClient::Request.new( connection_params('get', path: @path) )
      parse_result( request.execute )
    end

    private
      def parse_result(response)
        Hashie::Mash.new( JSON.parse(response)['ocs'] )
      end

      def connection_params(http_method, attributes={})
        id = attributes[:id]
        url = Ocman.configuration.base_url + "/ocs/v1.php/apps/files_sharing/api/v1/shares" + "#{'/' + id.to_s if id}"

        {
          url:      url,
          method:   http_method,
          user:     Ocman.configuration.user_name,
          password: Ocman.configuration.password,
          headers:  {
            'OCS-APIRequest' => true,
            params: {
              path: attributes[:path],
              format: 'json'
            }.reject {| key, value | value.nil? }
          }
        }
      end
  end
end
