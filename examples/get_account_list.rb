require "bundler/setup"
require '***REMOVED***/***REMOVED***'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'

require '***REMOVED***/***REMOVED***/request/account_list'

account_number = "000050100062708"

request = ***REMOVED***::***REMOVED***::Request::AccountList.new(
  :atm_card_number => "3333668800064418"
)

response = request.execute!

puts(response.parsed_body)
