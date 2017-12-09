require "plumbum/response/base"

class Plumbum::Response::AccountList < Plumbum::Response::Base
  def name
    parsed_body["Name"]
  end

  def atm_card_number
    parsed_body["ATMCardNo"]
  end

  def accounts
    @accounts ||= parsed_body["Accounts"].map { |account| Plumbum::ResponseElement::Account.new(account) }
  end

  def phone_numbers
    @phone_numbers ||= parsed_body["Phones"].map { |phone_number| Plumbum::ResponseElement::PhoneNumber.new(phone_number) }
  end
end
