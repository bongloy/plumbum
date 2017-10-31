require "***REMOVED***/***REMOVED***/request/base"
require "***REMOVED***/***REMOVED***/response/transfer"
require "***REMOVED***/***REMOVED***/request_parameter/amount"
require "securerandom"

class ***REMOVED***::***REMOVED***::Request::Transfer < ***REMOVED***::***REMOVED***::Request::Base
  ENDPOINT = "TransferOutAccount"
  RESPONSE_TYPE = ***REMOVED***::***REMOVED***::Response::Transfer

  attr_accessor :account_number,
                :amount,
                :identifier,
                :description,
                :otp,
                :fee

  def initialize(options = {})
    super
    self.account_number = options[:account_number]
    self.amount = options[:amount]
    self.identifier = options[:identifier]
    self.description = options[:description]
    self.otp = options[:otp]
    self.fee = options[:fee]
  end

  def to_h
    default_parameters.merge(optional_parameters.select { |k, v| v && !v.empty? })
  end

  def identifier
    @identifier ||= SecureRandom.uuid
  end

  private

  def default_parameters
    {
      "SAccountNo" => account_number,
      "Currency" => request_currency,
      "Amount" => request_amount,
      "UniqueID" => identifier,
      "OTPCode" => otp
    }
  end

  def optional_parameters
    {
      "Fee" => request_fee,
      "Remark" => description
    }
  end

  def request_currency
    amount.currency.to_s
  end

  def request_amount
    @request_amount ||= ***REMOVED***::***REMOVED***::RequestParameter::Amount.new.to_s(amount) if amount
  end

  def request_fee
    @request_fee ||= ***REMOVED***::***REMOVED***::RequestParameter::Amount.new.to_s(fee) if fee
  end
end

