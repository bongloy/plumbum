require "***REMOVED***/***REMOVED***/response"
require "***REMOVED***/***REMOVED***/encryptor"

class ***REMOVED***::***REMOVED***::Response::Base
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
    @decrypted_body ||= decrypt_body
  end

  def decrypt_body
    encrypted_timestamp, encrypted_body = raw_response.body.sub(/^"/, "").sub(/"$/, "").split(".")
    decrypted_timestamp = encryptor.decrypt(encrypted_timestamp)
    encryptor.decrypt(encrypted_body, encryptor.encryption_key + encrypted_timestamp)
  end

  def encryptor
    @encryptor ||= ***REMOVED***::***REMOVED***::Encryptor.new
  end
end
