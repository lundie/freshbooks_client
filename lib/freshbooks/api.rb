require 'net/http'
require 'uri'

module Freshbooks
  class API
    # Sends a post request to a URL.
    #
    # @param url [String] a URL to post to
    # @param body [Hash] a hash of params (to be be converted to XML)
    # @return a `Net::HTTP` object
    def post(url, body = {})
      req = Net::HTTP::Post.new(URI.parse(url))
      req.body = Freshbooks::API.to_xml(params)
      req.content_type = 'application/xml'

      Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
    end
  end
end
