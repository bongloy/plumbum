require "plumbum/request/base"
require "plumbum/response/account_list"

class Plumbum::Request::AccountList < Plumbum::Request::Base
  ENDPOINT = "GetAccountListByATMCardNo"
  RESPONSE_TYPE = Plumbum::Response::AccountList

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
