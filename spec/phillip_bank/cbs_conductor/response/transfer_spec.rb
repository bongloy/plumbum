require 'spec_helper'
require '***REMOVED***/***REMOVED***/response/transfer'

RSpec.describe ***REMOVED***::***REMOVED***::Response::Transfer do
  include ***REMOVED***::***REMOVED***::SpecHelpers::ResponseHelpers

  # assertions from VCR cassette response

  let(:fixture_filename) { "transfer_108.yml" }

  subject { build_response(fixture_filename) }

  describe "#account_number" do
    it { expect(subject.account_number).to eq("") }
  end

  describe "#trace_number" do
    it { expect(subject.trace_number).to eq("") }
  end

  describe "#icba_date" do
    it { expect(subject.icba_date).to eq(nil) }
  end

  describe "#transaction_date" do
    it {
      transaction_date = subject.transaction_date
      expect(transaction_date).to be_a(Time)
    }
  end
end

