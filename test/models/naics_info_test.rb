require "test_helper"

describe NaicsInfo do
  let(:naics_info) { NaicsInfo.new }

  it "must be valid" do
    value(naics_info).must_be :valid?
  end
end
