require 'spec_helper'
require 'plumbum/response_element/phone_number'

RSpec.describe Plumbum::ResponseElement::PhoneNumber do
  subject { described_class.new(attributes) }

  let(:phone_number) { "85510533537" }

  def attributes
    {
      "PhoneNo" => phone_number
    }
  end

  describe "#phone_number" do
    it { expect(subject.phone_number).to eq(phone_number) }
  end
end
