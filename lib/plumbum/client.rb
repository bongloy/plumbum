require 'httparty'

class Plumbum::Client
  DEFAULT_HTTP_CLIENT = HTTParty

  attr_accessor :http_client

  def initialize(options = {})
    self.http_client = options[:http_client]
  end

  def post(*args)
    http_client.post(*args)
  end

  def http_client
    @http_client ||= DEFAULT_HTTP_CLIENT
  end
end
