require "***REMOVED***/***REMOVED***/request/base"
require "***REMOVED***/***REMOVED***/response/get_account_list_by_atm_card_number"

class ***REMOVED***::***REMOVED***::Request::GetAccountListByAtmCardNumber < ***REMOVED***::***REMOVED***::Request::Base
  ENDPOINT = "GetAccountListByATMCardNo"
  RESPONSE_TYPE = ***REMOVED***::***REMOVED***::Response::GetAccountListByAtmCardNumber

  attr_accessor :atm_card_number

  def initialize(options = {})
    super
    self.atm_card_number = options[:atm_card_number]
  end

  def to_hash
    {
      "ATMCardNo" => atm_card_number
    }
  end
end
