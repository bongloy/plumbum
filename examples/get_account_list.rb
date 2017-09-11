require "bundler/setup"
require '***REMOVED***/***REMOVED***'

# load the ENV
require 'dotenv'
Dotenv.load

require '***REMOVED***/***REMOVED***/client'
require 'pry'

client = ***REMOVED***::***REMOVED***::Client.new
response = client.post("/api/GetAccountListByATMCardNo")
puts(response.code)
