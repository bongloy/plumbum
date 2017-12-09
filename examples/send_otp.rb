require "bundler/setup"
require 'plumbum'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'

require 'plumbum/request/otp'

request = Plumbum::Request::OTP.new(
  :account_number => "000010100280303",
  :phone_number => "855715100860"
)

response = request.execute!

puts(response.parsed_body)
