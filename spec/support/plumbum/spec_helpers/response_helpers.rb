module Plumbum::SpecHelpers::ResponseHelpers
  def response_builder
    @response_builder ||= Plumbum::SpecHelpers::ResponseBuilder.new
  end

  def build_raw_response(fixture_filename)
    response_builder.from_vcr_response(
      :fixture_filename => fixture_filename
    ) { |response_object, raw_body| allow(response_object).to receive_messages(:body => raw_body) }
  end

  def build_response(fixture_filename)
    described_class.new(:raw_response => build_raw_response(fixture_filename))
  end
end
