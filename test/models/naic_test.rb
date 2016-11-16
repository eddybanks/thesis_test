require "test_helper"

describe Naic do
  let(:naic) { Naic.new }

  it "must be valid" do
    value(naic).must_be :valid?
  end
end
