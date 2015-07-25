require 'test_helper'

describe Freshbooks::Client do
  before do
    @base_url = load_env['BASE_URL']
    @token = load_env['TOKEN']
    @client = Freshbooks::Client.new do |config|
      config.api_url = @base_url
      config.token = @token
    end
  end

  # see test_helper
  # checks to see if client.:first_param returns an instance of :second_param
  is_instance 'callbacks',       'Callback'
  is_instance 'categories',      'Category'
  is_instance 'clients',         'Client'
  is_instance 'estimates',       'Estimate'
  is_instance 'expenses',        'Expense'
  is_instance 'gateways',        'Gateway'
  is_instance 'invoices',        'Invoice'
  is_instance 'items',           'Item'
  is_instance 'languages',       'Language'
  is_instance 'payments',        'Payment'
  is_instance 'projects',        'Project'
  is_instance 'receipts',        'Receipt'
  is_instance 'recurring',       'Recurring'
  is_instance 'staff',           'Staff'
  is_instance 'systems',         'System'
  is_instance 'tasks',           'Task'
  is_instance 'taxes',           'Tax'
  is_instance 'time_entries',    'TimeEntry'
  is_instance 'contractors',     'Contractor'
  is_instance 'default_terms',   'DefaultTerm'
  is_instance 'reports',         'Report'
  is_instance 'currencies',      'Currency'
  is_instance 'email_templates', 'EmailTemplate'

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
