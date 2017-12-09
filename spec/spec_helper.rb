if ENV["START_SIMPLECOV"].to_i == 1
  require 'simplecov'
  SimpleCov.start
end

require_relative "support/dotenv"
require "bundler/setup"
require "plumbum"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
