class Plumbum::SpecHelpers::ResponseBuilder
  require 'httparty'

  def from_vcr_response(options = {}, &block)
    request_object = options[:request_object] || default_request_object
    vcr_response = options[:vcr_response] || load_vcr_response(options[:fixture_filename])
    raw_body = options[:body] || vcr_response["http_interactions"].last["response"]["body"]["string"]
    response_object = options[:response_object] || default_response_object
    yield(response_object, raw_body)
    HTTParty::Response.new(request_object, response_object, {})
  end

  private

  def load_vcr_response(fixture_filename)
    YAML.load_file(
      File.join(
        VCR.configuration.cassette_library_dir,
        fixture_filename
      )
    )
  end

  def default_request_object
    HTTParty::Request.new(Net::HTTP::Post, '/')
  end

  def default_response_object
    Net::HTTPOK.new('1.1', 200, 'OK')
  end
end
