require "test_helper"

describe Lic do
  let(:lic) { Lic.new }

  it "must be valid" do
    value(lic).must_be :valid?
  end
end
