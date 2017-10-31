require 'spec_helper'
require '***REMOVED***/***REMOVED***/encryptor'

RSpec.describe ***REMOVED***::***REMOVED***::Encryptor do
  let(:message_to_encrypt) { "foo" }
  let(:encryption_key) { "secret" }
  let(:env_encryption_key) { encryption_key }
  let(:asserted_cipher_text) { "\"2adEaJtIUH/lfrvZXgynEsndnbStRy5R.zCZ/epbFpZM=\"" }

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

  def freeze_time(&block)
    Timecop.freeze(Time.local(2015, 9, 30, 22, 10, 10, 10)) do
      yield
    end
  end

  describe "#encrypt_body(body)" do
    let(:result) { freeze_time { subject.encrypt_body(message_to_encrypt) } }
    let(:asserted_result) { asserted_cipher_text }
    it { assert_result! }
  end

  describe "#decrypt_body(encrypted_body)" do
    let(:encrypted_body) { asserted_cipher_text }
    let(:result) { subject.decrypt_body(encrypted_body) }
    let(:asserted_result) { message_to_encrypt }

    it { assert_result! }
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
