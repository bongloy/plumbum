require "***REMOVED***/***REMOVED***/request_parameter"

class ***REMOVED***::***REMOVED***::RequestParameter::Amount
  require 'money'

  def to_s(money)
    case money.currency
    when "KHR"
      money.cents.to_s
    else
      money.cents.abs.divmod(money.currency.subunit_to_unit).join(".")
    end
  end

  def from_s(amount, currency)
    money_currency = Money.new(0, currency).currency
    case money_currency
    when "KHR"
      Money.new(amount, money_currency)
    else
      Money.new(amount.to_f * money_currency.subunit_to_unit, money_currency)
    end
  end
end
