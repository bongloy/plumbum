require 'spec_helper'
require 'plumbum/request/transfer'

RSpec.describe Plumbum::Request::Transfer do
  require 'money'

  let(:currency) { "USD" }
  let(:account_number) { "000010100280303" }
  let(:amount) { Money.new(1000, currency) }
  let(:otp) { "123456" }
  let(:identifier) { nil }
  let(:description) { nil }
  let(:fee) { nil }

  def attributes
    {
      :account_number => account_number,
      :amount => amount,
      :otp => otp,
      :identifier => identifier,
      :description => description,
      :fee => fee
    }
  end

  subject { described_class.new(attributes) }

  describe "#to_h" do
    let(:result) { subject.to_h }
    let(:asserted_identifier) { subject.identifier }
    let(:asserted_remark) { asserted_identifier }

    def asserted_keys
      {
        "SAccountNo" => nil,
        "Currency" => nil,
        "Amount" => nil,
        "UniqueID" => nil,
        "OTPCode" => nil,
        "Remark" => nil
      }
    end

    def assert_to_h!
      expect(result.keys).to match_array(asserted_keys.keys)
      expect(result["SAccountNo"]).to eq(account_number)
      expect(result["Currency"]).to eq(currency)
      expect(result["Amount"]).to eq("10.0")
      expect(result["UniqueID"]).to eq(asserted_identifier)
      expect(result["OTPCode"]).to eq(otp)
      expect(result["Remark"]).to eq(asserted_remark)
    end

    context "by default" do
      it { assert_to_h! }
    end

    context "identifier is specified" do
      let(:identifier) { "12345" }
      let(:asserted_identifier) { identifier }

      it { assert_to_h! }
    end

    context "fee is specified" do
      let(:fee) { Money.new(100, currency) }

      def asserted_keys
        super.merge("Fee" => nil)
      end

      def assert_to_h!
        super
        expect(result["Fee"]).to eq("1.0")
      end

      it { assert_to_h! }
    end

    context "description is specified" do
      let(:description) { "foo bar baz" }
      let(:asserted_remark) { description }
      it { assert_to_h! }
    end
  end

  describe "#identifier" do
    it { expect(subject.identifier).not_to eq(nil) }
  end

  describe "#execute!", :vcr do
    include Plumbum::SpecHelpers::RequestAssertions

    let(:response) { subject.execute! }

    before do
      setup_scenario
    end

    def setup_scenario
      response
    end

    def assert_execute!
      super
      expect(response).to be_a(Plumbum::Response::Transfer)
    end

    context "successful request", :cassette => :transfer do
      let(:asserted_successful) { true }
#      it { assert_execute! }
    end

    context "error 108", :cassette => :transfer_108 do
      let(:asserted_successful) { false }

      def assert_execute!
        super
        expect(response.error_code).to eq("108")
        expect(response.error_message).to eq("Token is expired")
      end

      it { assert_execute! }
    end

    context "error 110", :cassette => :transfer_110 do
      let(:asserted_successful) { false }

      def assert_execute!
        super
        expect(response.error_code).to eq("110")
        expect(response.error_message).to eq("Failed to Process Transaction")
      end

      it { assert_execute! }
    end
  end
end
