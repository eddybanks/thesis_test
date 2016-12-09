require "test_helper"

describe Film do
  let(:film) { Film.new }

  it "must be valid" do
    value(film).must_be :valid?
  end
end
