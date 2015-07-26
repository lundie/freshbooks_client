# Freshbooks API Client

[![Inch
Documentation](http://inch-ci.org/github/littlelines/freshbooks_client.svg?branch=master)](http://www.rubydoc.info/github/littlelines/freshbooks_client/)
[![Build Status](http://img.shields.io/travis/littlelines/freshbooks_client.svg)](https://travis-ci.org/littlelines/freshbooks_client)
[![Dependency Status](http://img.shields.io/gemnasium/littlelines/freshbooks_client.svg)](https://gemnasium.com/littlelines/freshbooks_client)
[![Code Climate](http://img.shields.io/codeclimate/github/littlelines/freshbooks_client.svg)](https://codeclimate.com/github/littlelines/freshbooks_client)
[![Gem Version](http://img.shields.io/gem/v/freshbooks_client.svg)](https://rubygems.org/gems/freshbooks_client)

## [Documentation!]('http://www.rubydoc.info/github/littlelines/freshbooks_client/')

## Usage

```ruby
# configure a freshbooks client
freshbooks = Freshbooks::Client.new do |config|
  config.api_url = 'https://mycompany.freshbooks.com/'
  config.token = 'API_TOKEN'
end

# OR
freshbooks = Freshbooks::Client.new(api_url: 'https://mycompany.freshbooks.com/', token: 'API_TOKEN')

# access an API endpoint
projects = freshbooks.projects # => #<Freshbooks::API::Project>
projects.list # => { ... }

projects = Freshbooks::API::Project.new(config_options)
```
