require "***REMOVED***/***REMOVED***/request/base"
require "***REMOVED***/***REMOVED***/response/send_otp"

class ***REMOVED***::***REMOVED***::Request::SendOTP < ***REMOVED***::***REMOVED***::Request::Base
  ENDPOINT = "SendOTPCodeByAccountNo"
  RESPONSE_TYPE = ***REMOVED***::***REMOVED***::Response::SendOTP

  attr_accessor :account_number, :phone_number

  def initialize(options = {})
    super
    self.account_number = options[:account_number]
    self.phone_number = options[:phone_number]
  end

  def to_hash
    {
      "AccountNo" => account_number,
      "PhoneNo" => phone_number
    }
  end
end
