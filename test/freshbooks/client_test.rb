require 'test_helper'

describe Freshbooks::Client do
  before do
    @client = Freshbooks::Client.new do |config|
      config.api_url = ENV['BASE_URL']
      config.token = ENV['TOKEN']
    end
  end

  describe 'it should '

  describe '#to_request' do
    it 'creates valid API request XML' do
      expected = remove_xml_whitespace fixture('client/api_req.xml')
      actual = @client.to_request(
        {
          method: 'foo.bar',
          client_id: 22,
          body_text: 'Lorem ipsum.'
        }
      )
      assert_match expected, actual
    end
  end

  describe '#hash_to_raw_xml' do
    it 'create raw (nested) XML from a hash' do
      expected = remove_xml_whitespace(fixture('client/nested_raw.xml'))
      actual = @client.hash_to_raw_xml({ something: { here: "Okay", there: { what: "now" }}})
      assert_equal actual, expected
    end
  end

  describe '#parse' do
    it 'parses XML into a hash' do
      expected = { "foo" => "bar", "status" => "ok" }
      actual = @client.parse fixture('client/to_hash.xml')
      assert_equal expected, actual
    end

    it 'parses nested XML into a hash' do
      expected = { "foo" => { "bar" => "baz" }, "status" => "ok" }
      actual = @client.parse fixture('client/nested.xml')
      assert_equal expected, actual
    end
  end
end
