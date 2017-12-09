require "***REMOVED***/***REMOVED***/request/base"
require "***REMOVED***/***REMOVED***/response/account_list"

class ***REMOVED***::***REMOVED***::Request::AccountList < ***REMOVED***::***REMOVED***::Request::Base
  ENDPOINT = "GetAccountListByATMCardNo"
  RESPONSE_TYPE = ***REMOVED***::***REMOVED***::Response::AccountList

  attr_accessor :atm_card_number

  def initialize(options = {})
    super
    self.atm_card_number = options[:atm_card_number]
  end

  def to_h
    {
      "ATMCardNo" => atm_card_number
    }
  end
end
