require "***REMOVED***/***REMOVED***/response"
require "***REMOVED***/***REMOVED***/encryptor"

class ***REMOVED***::***REMOVED***::Response::Base
  attr_accessor :raw_response

  def initialize(options = {})
    self.raw_response = options[:raw_response]
  end

  def code
    raw_response && raw_response.code
  end

  def body
    decrypted_body
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
