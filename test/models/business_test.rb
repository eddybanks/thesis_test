require "test_helper"

describe Business do
  let(:business) { Business.new }

  it "must be valid" do
    value(business).must_be :valid?
  end
end
