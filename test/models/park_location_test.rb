require "test_helper"

describe ParkLocation do
  let(:park_location) { ParkLocation.new }

  it "must be valid" do
    value(park_location).must_be :valid?
  end
end
