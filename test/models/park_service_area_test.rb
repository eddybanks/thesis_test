require "test_helper"

describe ParkServiceArea do
  let(:park_service_area) { ParkServiceArea.new }

  it "must be valid" do
    value(park_service_area).must_be :valid?
  end
end
