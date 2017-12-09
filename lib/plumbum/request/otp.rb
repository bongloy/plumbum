require "plumbum/request/base"
require "plumbum/response/otp"

class Plumbum::Request::OTP < Plumbum::Request::Base
  ENDPOINT = "SendOTPCodeByAccountNo"
  RESPONSE_TYPE = Plumbum::Response::OTP

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
