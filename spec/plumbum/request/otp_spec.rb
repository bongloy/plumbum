require 'spec_helper'
require 'plumbum/request/otp'

RSpec.describe Plumbum::Request::OTP do
  describe "#execute!", :vcr do
    include Plumbum::SpecHelpers::RequestAssertions

    let(:response) { subject.execute! }

    def attributes
      {
        :account_number => account_number,
        :phone_number => phone_number
      }
    end

    subject { described_class.new(attributes) }

    before do
      setup_scenario
    end

    def setup_scenario
      response
    end

    def assert_execute!
      super
      expect(response).to be_a(Plumbum::Response::OTP)
    end

    context "successful request", :cassette => :send_otp do
      let(:asserted_successful) { true }
      let(:account_number) { "000010100280303" }
      let(:phone_number) { "855715100860" }
      it { assert_execute! }
    end

    context "error 110", :cassette => :send_otp_110 do
      let(:account_number) { "000010100280303" }
      let(:phone_number) { "85510533537" }

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
