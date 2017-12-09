require_relative "base"

class Plumbum::ResponseElement::PhoneNumber < Plumbum::ResponseElement::Base
  attr_accessor :phone_number

  def initialize(options = {})
    self.phone_number = options["PhoneNo"]
  end
end
