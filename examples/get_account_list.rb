require "bundler/setup"
require 'plumbum'

# load the ENV
require 'dotenv'
Dotenv.load

require 'pry'

require 'plumbum/request/account_list'

account_number = "000050100062708"

request = Plumbum::Request::AccountList.new(
  :atm_card_number => "3333668800064418"
)

response = request.execute!

puts(response.parsed_body)
