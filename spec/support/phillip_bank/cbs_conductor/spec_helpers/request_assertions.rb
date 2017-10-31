module ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertions
  def assertion_helper
    @assertion_helper ||= ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertionHelper.new
  end

  def request
    @request ||= WebMock.requests.last
  end

  def assert_execute!
    headers = request.headers
    expect(headers["Accept"]).to eq(assertion_helper.asserted_content_type)
    expect(headers["Content-Type"]).to eq(assertion_helper.asserted_content_type)
    expect(headers["Api-Key"]).to eq(assertion_helper.asserted_api_key)
    authorization = Base64.decode64(headers["Authorization"].sub(/^Basic\s/, ""))
    user, password = authorization.split(":")
    expect(user).to eq(assertion_helper.asserted_basic_auth_user)
    expect(password).to eq(assertion_helper.asserted_basic_auth_password)
  end
end
