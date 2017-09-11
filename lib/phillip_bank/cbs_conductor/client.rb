require 'httparty'

class ***REMOVED***::***REMOVED***::Client
  DEFAULT_HTTP_CLIENT = HTTParty

  attr_accessor :http_client, :base_url

  def initialize(options = {})
    self.http_client = options[:http_client]
    self.base_url = options[:base_url]
  end

  def post(url, *args)
    http_client.post(URI.join(base_url, url), *args)
  end

  def http_client
    @http_client || DEFAULT_HTTP_CLIENT
  end

  def base_url
    @base_url || ENV["***REMOVED***_***REMOVED***_BASE_URL"]
  end
end
