require 'spec_helper'
require '***REMOVED***/***REMOVED***/request/send_otp'

RSpec.describe ***REMOVED***::***REMOVED***::Request::SendOTP do
  describe "#execute!", :vcr, :cassette => :send_otp_110 do
    include ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertions

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
      expect(response).to be_a(***REMOVED***::***REMOVED***::Response::SendOTP)
    end

    context "successful request" do
      let(:asserted_successful) { true }
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
