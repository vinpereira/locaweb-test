require 'vcr'

VCR.configure do |config|
  # the directory where your cassettes will be saved
  config.cassette_library_dir = 'fixtures/vcr_cassettes'

  # the HTTP request service
  config.hook_into :webmock

  # Allow HTTP connection only if no cassette is available
  config.allow_http_connections_when_no_cassette = true
end
