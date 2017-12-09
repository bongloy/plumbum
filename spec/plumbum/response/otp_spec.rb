require 'spec_helper'
require '***REMOVED***/***REMOVED***/response/otp'

RSpec.describe ***REMOVED***::***REMOVED***::Response::OTP do
  include ***REMOVED***::***REMOVED***::SpecHelpers::ResponseHelpers

  # assertions from VCR cassette response

  let(:fixture_filename) { "send_otp.yml" }

  subject { build_response(fixture_filename) }

  describe "#successful?" do
    it { is_expected.to be_successful }
  end

  describe "#error_code" do
    it { expect(subject.error_code).to eq("00") }
  end

  describe "#error_message" do
    it { expect(subject.error_message).to eq("Approved and completed successfully") }
  end
end

