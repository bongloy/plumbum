require 'spec_helper'
require '***REMOVED***/***REMOVED***/request/get_account_list_by_atm_card_number'

RSpec.describe ***REMOVED***::***REMOVED***::Request::GetAccountListByAtmCardNumber do
  describe "#execute!", :vcr do

    include ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertions
    let(:response) { subject.execute! }

    def attributes
      {
        :atm_card_number => atm_card_number
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
      expect(response).to be_a(***REMOVED***::***REMOVED***::Response::GetAccountListByAtmCardNumber)
    end

    context "successful request", :cassette => :get_account_list_by_atm_card_number do
      let(:asserted_successful) { true }
      let(:atm_card_number) { "3333668800064418" }

      it { assert_execute! }
    end

    context "error 107", :cassette => :get_account_list_by_atm_card_number_107 do
      let(:asserted_successful) { false }
      let(:atm_card_number) { "wrong" }

      def assert_execute!
        super
        expect(response.error_code).to eq("107")
        expect(response.error_message).to eq("Validation Error")
      end

      it { assert_execute! }
    end
  end
end
