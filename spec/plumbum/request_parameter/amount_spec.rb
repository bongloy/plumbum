require 'spec_helper'
require '***REMOVED***/***REMOVED***/request_parameter/amount'

RSpec.describe ***REMOVED***::***REMOVED***::RequestParameter::Amount do
  describe "#to_s(money)" do
    let(:amount_cents) { "50045" }
    let(:amount) { Money.new(amount_cents, currency) }

    subject { described_class.new }
    let(:result) { subject.to_s(amount) }

    describe "for KHR" do
      let(:currency) { "KHR" }
      it { expect(result).to eq("50045") }
    end

    describe "for USD" do
      let(:currency) { "USD" }
      it { expect(result).to eq("500.45") }
    end
  end

  describe "#from_s(amount, currency)" do
    let(:amount) { "500.45" }

    subject { described_class.new }
    let(:result) { subject.from_s(amount, currency) }

    describe "for KHR" do
      let(:currency) { "khr" }
      it { expect(result).to eq(Money.new(500, "KHR")) }
    end

    describe "for USD" do
      let(:currency) { "usd" }
      it { expect(result).to eq(Money.new(50045, "USD")) }
    end
  end
end
