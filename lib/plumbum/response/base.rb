require "plumbum/response"
require "plumbum/encryptor"

class Plumbum::Response::Base
  ERROR_CODES = {
    :successful => "00"
  }

  attr_accessor :raw_response

  def initialize(options = {})
    self.raw_response = options[:raw_response]
  end

  def body
    decrypted_body
  end

  def parsed_body
    @parsed_body ||= JSON.parse(body)
  end

  def error_code
    parsed_body["ECode"]
  end

  def error_message
    parsed_body["EMessage"]
  end

  def successful?
    error_code == ERROR_CODES[:successful]
  end

  private

  def decrypted_body
    @decrypted_body ||= encryptor.decrypt_body(raw_response.body)
  end

  def encryptor
    @encryptor ||= Plumbum::Encryptor.new
  end
end
