require "***REMOVED***/***REMOVED***/response"

class ***REMOVED***::***REMOVED***::Response::Base
  attr_accessor :raw_response

  def initialize(options = {})
    self.raw_response = options[:raw_response]
  end

  def code
    raw_response && raw_response.code
  end
end
