require 'openssl'
require 'base64'

class ***REMOVED***::***REMOVED***::Encryptor
  ENCRYPTION_ALGORITHM = "des-ede3"
  DEFAULT_ENCRYPTION_KEY = "test"

  attr_accessor :encryption_key

  def initialize(options = {})
    self.encryption_key = options[:encryption_key]
  end

  def encrypt(message, key = encryption_key)
    cipher = setup_cipher(key)
    cipher.encrypt
    Base64.encode64(cipher.update(message) + cipher.final).chomp
  end

  def decrypt(message, key = encryption_key)
    cipher = setup_cipher(key)
    cipher.decrypt
    cipher.update(Base64.decode64(message)) + cipher.final
  end

  def encryption_key
    @encryption_key ||= ENV["***REMOVED***_***REMOVED***_ENCRYPTION_KEY"] || DEFAULT_ENCRYPTION_KEY
  end

  private

  def setup_cipher(key)
    cipher = OpenSSL::Cipher.new(encryption_algorithm)
    key_digest = Digest::MD5.hexdigest(key)
    mutated_key_digest = key_digest + key_digest[0..15]
    cipher.key = mutated_key_digest.scan(/../).map(&:hex).pack('c*')
    cipher
  end

  def encryption_algorithm
    ENCRYPTION_ALGORITHM
  end
end
