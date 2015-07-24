# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freshbooks/version'

Gem::Specification.new do |spec|
  spec.name          = "freshbooks_client"
  spec.version       = Freshbooks::VERSION
  spec.authors       = ["Jesse Herrick"]
  spec.email         = ["jesse@littlelines.com"]

  spec.summary       = %q{An awesome API client for Freshbooks.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/littlelines/freshbooks_client"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  # spec.add_runtime_dependency "virtus"
  spec.add_runtime_dependency "multi_xml"
  spec.add_runtime_dependency "hashie"
  spec.add_runtime_dependency "faraday_middleware"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
