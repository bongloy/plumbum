require 'spec_helper'
require '***REMOVED***/***REMOVED***/response/get_account_list_by_atm_card_number'
require '***REMOVED***/***REMOVED***/response_element/account'
require '***REMOVED***/***REMOVED***/response_element/phone_number'

RSpec.describe ***REMOVED***::***REMOVED***::Response::GetAccountListByAtmCardNumber do
  include ***REMOVED***::***REMOVED***::SpecHelpers::ResponseHelpers

  # assertions from VCR cassette response

  let(:fixture_filename) { "get_account_list_by_atm_card_number.yml" }

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

  describe "#name" do
    it { expect(subject.name).to eq("SMAE MENG LIM") }
  end

  describe "#atm_card_number" do
    it { expect(subject.atm_card_number).to eq("3333668800064418") }
  end

  describe "#accounts" do
    it {
      accounts = subject.accounts
      expect(accounts).to be_a(Array)
      account = accounts.first
      expect(account).to be_a(***REMOVED***::***REMOVED***::ResponseElement::Account)
      expect(account.number).to eq("000010100280303")
      expect(account.currency.to_s).to eq("USD")
      expect(account.primary).to eq("Y")
    }
  end

  describe "#phone_numbers" do
    it {
      phone_numbers = subject.phone_numbers
      expect(phone_numbers).to be_a(Array)
      phone_number = subject.phone_numbers.first
      expect(phone_number).to be_a(***REMOVED***::***REMOVED***::ResponseElement::PhoneNumber)
      expect(phone_number.phone_number).to eq("85517664614")
    }
  end
end

