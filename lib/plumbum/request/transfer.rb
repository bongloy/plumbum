require "plumbum/request/base"
require "plumbum/response/transfer"
require "plumbum/request_parameter/amount"
require "securerandom"

class Plumbum::Request::Transfer < Plumbum::Request::Base
  ENDPOINT = "TransferOutAccount"
  RESPONSE_TYPE = Plumbum::Response::Transfer

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

  def description
    @description ||= identifier
  end

  private

  def default_parameters
    {
      "SAccountNo" => account_number,
      "Currency" => request_currency,
      "Amount" => request_amount,
      "UniqueID" => identifier,
      "OTPCode" => otp,
      "Remark" => description
    }
  end

  def optional_parameters
    {
      "Fee" => request_fee
    }
  end

  def request_currency
    amount.currency.to_s
  end

  def request_amount
    @request_amount ||= Plumbum::RequestParameter::Amount.new.to_s(amount) if amount
  end

  def request_fee
    @request_fee ||= Plumbum::RequestParameter::Amount.new.to_s(fee) if fee
  end
end

