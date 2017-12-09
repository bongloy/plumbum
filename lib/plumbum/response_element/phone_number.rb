require_relative "base"

class ***REMOVED***::***REMOVED***::ResponseElement::PhoneNumber < ***REMOVED***::***REMOVED***::ResponseElement::Base
  attr_accessor :phone_number

  def initialize(options = {})
    self.phone_number = options["PhoneNo"]
  end
end
