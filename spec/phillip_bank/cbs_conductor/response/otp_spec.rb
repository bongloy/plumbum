require 'spec_helper'
require '***REMOVED***/***REMOVED***/response/otp'

RSpec.describe ***REMOVED***::***REMOVED***::Response::OTP do
  include ***REMOVED***::***REMOVED***::SpecHelpers::ResponseHelpers

  # assertions from VCR cassette response

  let(:fixture_filename) { "send_otp.yml" }

  subject { build_response(fixture_filename) }
end

