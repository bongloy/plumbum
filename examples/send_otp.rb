require "bundler/setup"
require '***REMOVED***/***REMOVED***'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'

require '***REMOVED***/***REMOVED***/request/send_otp'

request = ***REMOVED***::***REMOVED***::Request::SendOTP.new(
  :account_number => "000010100280303",
  :phone_number => "85510533537"
)

response = request.execute!

puts(response.parsed_body)