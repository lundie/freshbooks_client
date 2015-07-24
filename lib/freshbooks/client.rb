require 'multi_xml'
require 'faraday'

module Freshbooks
  class Client
    attr_accessor :oauth_token
    attr_accessor :method

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      yield(self) if block_given?
    end

    # Send post request to the API.
    #
    # @return HTTP request
    def post
      # faraday connection
    end

    def self.to_xml(params_hash = {})
      xml_template = <<-XML
<?xml version="1.0" encoding="utf-8"?>
<request method="#{params_hash[:method]}">
  <contents>
</request>
      XML

      xml_elements = []
      params_hash.delete(:method)
      params_hash.each do |key, value|
        xml_elements << "<#{key}>#{value}</#{key}>"
      end
      xml_template.gsub('<contents>', xml_elements.join(""))
    end

    def self.parse(xml_content)
      MultiXml.parse(xml_content)['response'].map { |tags| tags.map { |tag| tag.is_a?(String) ? tag.strip : tag } }.to_h
    end
  end
end
