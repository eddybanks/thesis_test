require "test_helper"

describe FullParkDatum do
  let(:full_park_datum) { FullParkDatum.new }

  it "must be valid" do
    value(full_park_datum).must_be :valid?
  end
end
