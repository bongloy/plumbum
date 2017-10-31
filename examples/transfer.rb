require "bundler/setup"
require '***REMOVED***/***REMOVED***'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'
require '***REMOVED***/***REMOVED***/request/transfer'

require 'money'

request = ***REMOVED***::***REMOVED***::Request::Transfer.new(
  :account_number => "000010100280303",
  :amount => Money.new(
    1000, "USD"
  ),
  :identifier => "123456",
  :remark => "Some text",
  :otp => "123456",
  :fee => nil
)

response = request.execute!

puts(response.parsed_body)
