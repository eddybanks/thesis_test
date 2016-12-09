require "test_helper"

describe ParkPsaManager do
  let(:park_psa_manager) { ParkPsaManager.new }

  it "must be valid" do
    value(park_psa_manager).must_be :valid?
  end
end
