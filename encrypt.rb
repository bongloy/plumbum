#!/usr/bin/env ruby

require "bundler/setup"

# From https://stackoverflow.com/questions/26493253/des-decryption-in-ruby

require 'openssl'
require 'pry'
require 'base64'

def decode(encryptedString, key, iv)
  decrypt = OpenSSL::Cipher.new('des-cbc')
  decrypt.decrypt
  decrypt.key = key
  decrypt.iv = iv.scan(/../).map{|b|b.hex}.pack('c*')
  decrypt.update(encryptedString) + decrypt.final
end

data = "foobar"
private_key = "a"

# Java
# digestOfPassword: 0CC175B9C0F1B6A831C399E269772661
# Key Bytes Original: 0CC175B9C0F1B6A831C399E2697726610000000000000000
# keyBytes Final : 0CC175B9C0F1B6A831C399E2697726610CC175B9C0F1B6A8
# Encrypted output: npcgGrOQFyQ=

# Actual Result
# "npcgGrOQFyQ=\n"

# Ruby
# Digest of Password: 0cc175b9c0f1b6a831c399e269772661
# Mutated Digest: 0CC175B9C0F1B6A831C399E2697726610CC175B9C0F1B6A8

#0CC175B9C0F1B6A831C399E2697726610CC175B9C0F1B6A8
#0CC175B9C0F1B6A831C399E2697726610CC175B9C0F1B6A8

# DESede/ECB/PKCS5Padding

#des-ede-cbc
#des-ede-cbc
#des-ede-cfb
#des-ede-ofb
#des-ede3
#des-ede3-cbc
#des-ede3-cfb
#des-ede3-cfb1
#des-ede3-cfb8
#des-ede3-ofb

# utility.getCurrentDateTime()

# 20170912143530039

binding.pry

cipher = OpenSSL::Cipher.new('des-ede3')
cipher.encrypt
key_digest = Digest::MD5.hexdigest(private_key)
mutated_key_digest = key_digest + key_digest[0..15]

cipher_key = mutated_key_digest.scan(/../).map(&:hex).pack('c*')
cipher.key = cipher_key
encrypted_value = cipher.update(data) + cipher.final
base64_encoded_value = Base64.encode64(encrypted_value)
p base64_encoded_value

