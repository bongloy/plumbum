require 'spec_helper'
require 'plumbum/request/account_list'

RSpec.describe Plumbum::Request::AccountList do
  describe "#execute!", :vcr do

    include Plumbum::SpecHelpers::RequestAssertions
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
      expect(response).to be_a(Plumbum::Response::AccountList)
    end

    context "successful request", :cassette => :account_list do
      let(:asserted_successful) { true }
      let(:atm_card_number) { "3333668800064418" }

      it { assert_execute! }
    end

    context "error 107", :cassette => :account_list_107 do
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
