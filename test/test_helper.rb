$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'freshbooks'

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new(color: true))

def fixtures_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.read(fixtures_path + '/' + file)
end

def remove_xml_whitespace(xml)
  xml.gsub(/>\s*</, "><").strip
end

def load_env
  require 'dotenv'
  Dotenv.load
end

def is_instance(meth, inst)
  describe "##{meth}" do
    it "should return a Freshbooks::API::#{inst} instance" do
      assert @client.projects.is_a?(eval("Freshbooks::API::#{inst}"))
    end
  end
end
