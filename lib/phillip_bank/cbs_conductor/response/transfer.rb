require "***REMOVED***/***REMOVED***/response/base"

class ***REMOVED***::***REMOVED***::Response::Transfer < ***REMOVED***::***REMOVED***::Response::Base
  def account_number
    parsed_body["SAccountNo"]
  end

  def trace_number
    parsed_body["TraceNo"]
  end

  def icba_date
    @icba_date ||= parse_date(parsed_body["ICBADate"])
  end

  def transaction_date
   @transaction_date ||= parse_date(parsed_body["TrxnDate"])
  end

  private

  def parse_date(raw_date)
    Time.parse(raw_date) if raw_date && !raw_date.empty?
  end
end
