require "plumbum/request"
require "plumbum/client"
require "plumbum/encryptor"

class Plumbum::Request::Base
  DEFAULT_BASE_URL = "http://localhost:14243/api_v01/api"
  DEFAULT_CONTENT_TYPE = "application/json"

  attr_accessor :client,
                :base_url,
                :api_key,
                :basic_auth_user,
                :basic_auth_password

  def initialize(options = {})
    self.client = options[:client]
    self.base_url = options[:base_url]
    self.api_key = options[:api_key]
    self.basic_auth_user = options[:basic_auth_user]
    self.basic_auth_password = options[:basic_auth_password]
  end

  def client
    @client ||= Plumbum::Client.new
  end

  def execute!
    response_type.new(:raw_response => client.post(url, client_options))
  end

  def to_json
    to_h.to_json
  end

  def url
    base_url + "/#{endpoint}"
  end

  def base_url
    @base_url ||= ENV["***REMOVED***_***REMOVED***_BASE_URL"] || DEFAULT_BASE_URL
  end

  def basic_auth_user
    @basic_auth_user ||= ENV["***REMOVED***_***REMOVED***_BASIC_AUTH_USER"]
  end

  def basic_auth_password
    @basic_auth_password ||= ENV["***REMOVED***_***REMOVED***_BASIC_AUTH_PASSWORD"]
  end

  def api_key
    @api_key ||= ENV["***REMOVED***_***REMOVED***_API_KEY"]
  end

  def body
    to_json
  end

  def headers
    {
      "Content-Type" => content_type,
      "Accept" => content_type,
      "api_key" => api_key
    }
  end

  private

  def basic_auth
    {
      :username => basic_auth_user,
      :password => basic_auth_password
    }
  end

  def content_type
    DEFAULT_CONTENT_TYPE
  end

  def client_options
    {
      :body => encryptor.encrypt_body(body),
      :headers => headers,
      :basic_auth => basic_auth
    }
  end

  def response_type
    self.class::RESPONSE_TYPE
  end

  def endpoint
    self.class::ENDPOINT
  end

  def encryptor
    @encryptor ||= Plumbum::Encryptor.new
  end
end
