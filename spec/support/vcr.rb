require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'

  filtered_data_regexp = /^PLUMBUM_/

  ENV.select { |key, value| key =~ filtered_data_regexp }.each do |key, value|
    filter_name = key.sub(filtered_data_regexp, "")
    c.filter_sensitive_data("FILTERED_#{filter_name}") do |interaction|
      value
    end
  end
end

RSpec.configure do |config|
  config.around(:vcr => true) do |example|
    cassette = example.metadata[:cassette] || raise(ArgumentError, "You must specify a cassette")
    vcr_options = example.metadata[:vcr_options] || {}
    VCR.use_cassette(cassette, vcr_options) { example.run }
  end
end

