require "***REMOVED***/***REMOVED***/request/base"
require "***REMOVED***/***REMOVED***/response/otp"

class ***REMOVED***::***REMOVED***::Request::OTP < ***REMOVED***::***REMOVED***::Request::Base
  ENDPOINT = "SendOTPCodeByAccountNo"
  RESPONSE_TYPE = ***REMOVED***::***REMOVED***::Response::OTP

  attr_accessor :account_number, :phone_number

  def initialize(options = {})
    super
    self.account_number = options[:account_number]
    self.phone_number = options[:phone_number]
  end

  def to_h
    {
      "AccountNo" => account_number,
      "PhoneNo" => phone_number
    }
  end
end
