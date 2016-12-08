require "test_helper"

describe ParkAreaDist do
  let(:park_area_dist) { ParkAreaDist.new }

  it "must be valid" do
    value(park_area_dist).must_be :valid?
  end
end
