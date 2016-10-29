require "test_helper"

describe PsaManager do
  let(:psa_manager) { PsaManager.new }

  it "must be valid" do
    value(psa_manager).must_be :valid?
  end
end
