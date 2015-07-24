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
