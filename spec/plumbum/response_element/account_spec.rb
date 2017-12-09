require 'spec_helper'
require 'plumbum/response_element/account'

RSpec.describe Plumbum::ResponseElement::Account do
  subject { described_class.new(attributes) }

  let(:account_number) { "000010100280303" }
  let(:currency) { "USD" }
  let(:primary) { "Y" }

  def attributes
    {
      "AccountNo" => account_number,
      "Currency" => currency,
      "Primary" => primary
    }
  end

  describe "#primary" do
    it { expect(subject.primary).to eq(primary) }
  end

  describe "#primary?" do
    it { is_expected.to be_primary }
  end

  describe "#number" do
    it { expect(subject.number).to eq(account_number) }
  end

  describe "#currency" do
    it { expect(subject.currency).to eq(Money::Currency.new(currency)) }
  end
end
