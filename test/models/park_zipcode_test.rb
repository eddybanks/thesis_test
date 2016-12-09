require "test_helper"

describe ParkZipcode do
  let(:park_zipcode) { ParkZipcode.new }

  it "must be valid" do
    value(park_zipcode).must_be :valid?
  end
end
