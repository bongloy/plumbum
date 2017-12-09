require "***REMOVED***/***REMOVED***/response/base"

class ***REMOVED***::***REMOVED***::Response::AccountList < ***REMOVED***::***REMOVED***::Response::Base
  def name
    parsed_body["Name"]
  end

  def atm_card_number
    parsed_body["ATMCardNo"]
  end

  def accounts
    @accounts ||= parsed_body["Accounts"].map { |account| ***REMOVED***::***REMOVED***::ResponseElement::Account.new(account) }
  end

  def phone_numbers
    @phone_numbers ||= parsed_body["Phones"].map { |phone_number| ***REMOVED***::***REMOVED***::ResponseElement::PhoneNumber.new(phone_number) }
  end
end
