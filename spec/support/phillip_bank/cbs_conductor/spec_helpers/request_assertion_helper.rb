class ***REMOVED***::***REMOVED***::SpecHelpers::RequestAssertionHelper
  ASSERTED_CONTENT_TYPE = "application/json"

  def asserted_content_type
    ASSERTED_CONTENT_TYPE
  end

  def asserted_api_key
    ENV["***REMOVED***_***REMOVED***_API_KEY"]
  end

  def asserted_basic_auth_user
    ENV["***REMOVED***_***REMOVED***_BASIC_AUTH_USER"]
  end

  def asserted_basic_auth_password
    ENV["***REMOVED***_***REMOVED***_BASIC_AUTH_PASSWORD"]
  end
end
