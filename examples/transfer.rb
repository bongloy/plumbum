require "bundler/setup"
require 'plumbum'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'
require 'plumbum/request/otp'
require 'plumbum/request/transfer'
require 'money'

account_number = "000050100062708"
phone_number = "855715100860"

otp_request = Plumbum::Request::OTP.new(
  :account_number => account_number,
  :phone_number => phone_number
)

otp_response = otp_request.execute!

if otp_response.successful?
  puts("Enter OTP:")
  otp = gets.chomp

    request = Plumbum::Request::Transfer.new(
    :account_number => account_number,
    :amount => Money.new(
      1000, "USD"
    ),
    :otp => otp
  )

  response = request.execute!

  puts(response.parsed_body)
else
  puts "OTP request error"
end
