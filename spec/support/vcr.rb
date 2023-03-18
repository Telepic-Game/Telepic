# frozen_string_literal: true

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true

  # For filtering add values and uncomment
  # config.filter_sensitive_data('<API_KEY>',ENV('API_KEY'))
end
