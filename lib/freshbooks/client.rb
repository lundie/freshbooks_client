require 'multi_xml'
require 'faraday'
require 'faraday_middleware'
require 'hashie'

# Namespace for all methods, attributes, and classes used to
# wrap the Freshbooks API.
module Freshbooks
  # Superclass that contains all logic and methods needed to send
  # and parse XML from the Freshbooks API.
  #
  # @author Jesse Herrick
  # @abstract
  # @since 0.1.0
  #
  # @attr [String] token auth token provided by Freshbooks
  # @attr [String] api_url the base URL of the API endpoint provided
  #                by Freshbooks
  class Client
    attr_accessor :token
    attr_accessor :api_url

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      @endpoint = underscore(self.class.to_s.split('::').last)

      yield(self) if block_given?
    end

    include Freshbooks::API::Methods
    include Freshbooks::API::CRUD

    # Makes an API call via the #post method.
    #
    # @param method [String] The API method as defined in the Freshbooks API docs.
    # @param struct [Array] All required parameters for the request.
    # @param params [Hash] The parameters passed to the request.
    #
    # @example Create a callback.
    #   call('callback.create', [:event, :uri], {event: 'Foo', uri: 'https://jesse.codes/'})
    #   # => {...}
    #
    # @example List projects.
    #   call('project.list')
    #   # => {...}
    #
    # @return [Hash] An API request hash.
    def call(method, params = {})
      # unless params.empty?
      #   # ensure that params definied in the struct exist
      #   struct.each do |p|
      #     body[p] = params.fetch(p)
      #     params.delete(p)
      #   end
      #
      #   body.merge(params) unless params.empty?
      # end

      post_body = {method: method}
      post_body = post_body.merge(params) unless params.empty?

      post(post_body)
    end

    # Send post request to the API.
    #
    # @return HTTP request
    def post(body)
      @connection = Faraday.new(@api_url) do |conn|
        conn.use FaradayMiddleware::Mashify
        conn.response :xml
        conn.basic_auth @token, 'X'
        conn.adapter Faraday.default_adapter
      end

      resp = @connection.post do |req|
        req.url '/api/2.1/xml-in'
        req.headers['Content-Type'] = 'application/xml'
        req.body = to_request(body)
      end

      body = resp.body.response
      if body.empty?
        resp.status
      else
        body
      end
    end

    # Parses XML response into a hash.
    #
    # @param xml_content [String] A string of XML to be parsed.
    #
    # @return [Hash] A hash of the converted XML response.
    def parse(xml_content)
      MultiXml.parser = :nokogiri
      MultiXml.parse(xml_content)['response']
    end

    # Converts a data hash into a usable Freshbooks API XML request.
    #
    # It parses the hash and removes relevant request attributes. Then
    # it uses the method, #hash_to_raw_xml to convert it into XML.
    #
    # @param data_hash [Hash] a hash to build the request from
    #
    def to_request(data_hash)
      req_method = data_hash.delete(:method)
      '<?xml version="1.0" encoding="utf-8"?>' +
      "<request method=\"#{req_method}\">" +
        hash_to_raw_xml(data_hash) +
      '</request>'
    end

    # Converts a raw hash into raw XML.
    #
    # @param object [Hash] a hash to build the XML from
    # @param built [String] a string of built XML added recursively by the method
    #
    # @example convert hash to XML
    #   data = {foo: {bar: {this: 'that'}}}
    #   hash_to_raw_xml(data)
    #   # => "<foo><bar><this>that</this></bar></foo>"
    #
    # @return [String] a raw XML string
    def hash_to_raw_xml(object, built = '')
      case object
      when Hash
        case
        when object.count > 1
          object.each { |h| built += "<#{h.first.to_s}>#{hash_to_raw_xml(h.last)}</#{h.first.to_s}>" }
        when object.count == 1
          object.each { |h| built += "<#{h.first.to_s}>#{hash_to_raw_xml(h.last, built)}</#{h.first.to_s}>" }
        end
      when String
        built += object
      when Integer
        built += object.to_s
      end
      built
    end

    # Generates a hash of options to pass to {Freshbooks::Client}.
    #
    # @return [Hash] a hash of options.
    def options
      {
        api_url: @api_url,
        token: @token
      }
    end

    # Converts a CamelCased word with an underscored_one.
    #
    # @param camel_cased_word [String] A string to underscore.
    #
    # @return An underscored string.
    def underscore(camel_cased_word)
      camel_cased_word.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end
end
