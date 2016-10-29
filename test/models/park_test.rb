require "test_helper"

describe Park do
  let(:park) { Park.new }

  it "must be valid" do
    value(park).must_be :valid?
  end
end
