require "***REMOVED***/***REMOVED***/request"
require "***REMOVED***/***REMOVED***/client"

class ***REMOVED***::***REMOVED***::Request::Base
  DEFAULT_BASE_URL = "http://localhost:14143/api"

  attr_accessor :client, :base_url

  def initialize(options = {})
    self.client = options[:client]
    self.base_url = options[:base_url]
  end

  def client
    @client ||= ***REMOVED***::***REMOVED***::Client.new
  end

  def execute!
    response_type.new(:raw_response => client.post(url, default_execute_options))
  end

  def to_json
    to_hash.to_json
  end

  def url
    base_url + "/#{endpoint}"
  end

  def base_url
    @base_url ||= ENV["***REMOVED***_***REMOVED***_BASE_URL"] || DEFAULT_BASE_URL
  end

  private

  def default_execute_options
    {
      :body => default_execute_body,
      :headers => default_execute_headers
    }
  end

  def default_execute_body
    to_json
  end

  def default_execute_headers
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  end

  def response_type
    self.class::RESPONSE_TYPE
  end

  def endpoint
    self.class::ENDPOINT
  end
end
