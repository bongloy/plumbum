require 'openssl'
require 'base64'

class Plumbum::Encryptor
  ENCRYPTION_ALGORITHM = "des-ede3"
  DEFAULT_ENCRYPTION_KEY = "test"
  LOCAL_TIMEZONE = "+07:00"

  attr_accessor :encryption_key

  def initialize(options = {})
    self.encryption_key = options[:encryption_key]
  end

  def encryption_key
    @encryption_key ||= ENV["PLUMBUM_ENCRYPTION_KEY"] || DEFAULT_ENCRYPTION_KEY
  end

  def encrypt_body(body)
    encrypted_timestamp = encrypt(timestamp)
    encrypted_body = encrypt(body, encryption_key + encrypted_timestamp)
    encrypted_timestamp_with_body = [encrypted_timestamp, encrypted_body].join(".")
    # body needs to be double quoted
    "\"#{encrypted_timestamp_with_body}\""
  end

  def decrypt_body(encrypted_body)
    encrypted_timestamp, encrypted_body = encrypted_body.sub(/^"/, "").sub(/"$/, "").split(".")
    decrypted_timestamp = decrypt(encrypted_timestamp)
    decrypt(encrypted_body, encryption_key + encrypted_timestamp)
  end

  private

  def timestamp
    Time.now.getlocal(LOCAL_TIMEZONE).strftime("%Y%m%d%H%M%S%L")
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
