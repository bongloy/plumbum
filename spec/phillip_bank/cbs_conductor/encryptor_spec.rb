require 'spec_helper'
require '***REMOVED***/***REMOVED***/encryptor'

RSpec.describe ***REMOVED***::***REMOVED***::Encryptor do
  let(:message_to_encrypt) { "foo" }

  let(:asserted_cipher_text) {
    {
      "secret" => "ukefRgMGCPQ=",
      "bigsecret" => "UVknqKbLU8g="
    }
  }

  let(:encryption_key) { "secret" }
  let(:env_encryption_key) { encryption_key }

  before do
    setup_scenario
  end

  def setup_scenario
    stub_env(env)
  end

  def env
    {
      "***REMOVED***_***REMOVED***_ENCRYPTION_KEY" => env_encryption_key
    }
  end

  def assert_result!
    expect(result).to eq(asserted_result)
  end

  describe "#encrypt(message, key = encryption_key)" do
    let(:result) { subject.encrypt(*args) }

    context "passing only the message" do
      let(:args) { [message_to_encrypt] }
      let(:asserted_result) { asserted_cipher_text[env_encryption_key] }
      it { assert_result! }
    end

    context "passing a key" do
      let(:args) { [message_to_encrypt, "bigsecret"] }
      let(:asserted_result) {  asserted_cipher_text["bigsecret"] }
      it { assert_result! }
    end
  end

  describe "#decrypt(message, key = encryption_key)" do
    let(:result) { subject.decrypt(*args) }
    let(:asserted_result) { message_to_encrypt }

    context "passing only the message" do
      let(:args) { [message_to_decrypt] }
      let(:message_to_decrypt) { asserted_cipher_text[env_encryption_key] }
      it { assert_result! }
    end

    context "passing a key" do
      let(:args) { [message_to_decrypt, "bigsecret"] }
      let(:message_to_decrypt) { asserted_cipher_text["bigsecret"] }
      it { assert_result! }
    end
  end

  describe "#encryption_key" do
    let(:result) { subject.encryption_key }

    context "***REMOVED***_***REMOVED***_ENCRYPTION_KEY=" do
      let(:env_encryption_key) { nil }
      let(:asserted_result) { described_class::DEFAULT_ENCRYPTION_KEY }

      it { assert_result! }
    end

    context "***REMOVED***_***REMOVED***_ENCRYPTION_KEY=secret" do
      let(:asserted_result) { env_encryption_key }

      it { assert_result! }
    end
  end
end
