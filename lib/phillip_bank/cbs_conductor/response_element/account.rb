require_relative "base"

class ***REMOVED***::***REMOVED***::ResponseElement::Account < ***REMOVED***::***REMOVED***::ResponseElement::Base
  require 'money'

  PRIMARY = "Y"

  attr_accessor :number, :currency, :primary

  def initialize(options = {})
    self.number = options["AccountNo"]
    self.currency = Money::Currency.new(options["Currency"])
    self.primary = options["Primary"]
  end

  def primary?
    primary == PRIMARY
  end
end
