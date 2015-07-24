require 'test_helper'

describe Freshbooks::Client do
  before do
    @client = Freshbooks::Client.new
  end

  describe '#to_xml' do
    it 'should convert a hash to XML' do
      expected = { method: 'foo.bar', foo: 'bar' }
      assert_equal fixture('from_hash.xml').read, @client.to_xml(expected)
    end
  end

  describe '#parse' do
    it 'parses XML into a hash' do
      expected = { "foo" => "bar", "status" => "ok" }
      actual = @client.parse fixture('to_hash.xml').read
      assert_equal expected, actual
    end

    it 'parses nested XML into a hash' do
      expected = { "foo" => { "bar" => "baz" }, "status" => "ok" }
      actual = @client.parse fixture('nested.xml').read
      assert_equal expected, actual
    end
  end
end
