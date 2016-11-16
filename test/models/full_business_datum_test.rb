require "test_helper"

describe FullBusinessDatum do
  let(:full_business_datum) { FullBusinessDatum.new }

  it "must be valid" do
    value(full_business_datum).must_be :valid?
  end
end
