require 'test_helper'

describe Freshbooks::Client do
  describe '.to_xml' do
    it 'should convert a hash to XML' do
      expected = { method: 'foo.bar', foo: 'bar' }
      assert_equal fixture('from_hash.xml'), Freshbooks::Client.to_xml(expected)
    end
  end

  describe '.parse' do
    it 'parses XML into a hash' do
      expected = { "foo" => "bar", "status" => "ok" }
      actual = Freshbooks::Client.parse fixture('to_hash.xml')
      assert_equal expected, actual
    end

    it 'parses nested XML into a hash' do
      expected = { "foo" => { "bar" => "baz" }, "status" => "ok" }
      actual = Freshbooks::Client.parse fixture('nested.xml')
      assert_equal expected, actual
    end
  end
end
