require "bundler/setup"
require '***REMOVED***/***REMOVED***'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'

require '***REMOVED***/***REMOVED***/request/get_account_list_by_atm_card_number'
request = ***REMOVED***::***REMOVED***::Request::GetAccountListByAtmCardNumber.new(
  :atm_card_number => "3333668800064418"
)

response = request.execute!

puts(response.code)
