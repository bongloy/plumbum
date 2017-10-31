require 'spec_helper'
require '***REMOVED***/***REMOVED***/request/get_account_list_by_atm_card_number'

RSpec.describe ***REMOVED***::***REMOVED***::Request::GetAccountListByAtmCardNumber do
  describe "#execute!", :vcr, :cassette => :get_account_list_by_atm_card_number do
    include ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertions
    let(:atm_card_number) { "3333668800064418" }
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
      expect(response).to be_successful
    end

    it { assert_execute! }
  end
end
