require "test_helper"

describe FilmDistributor do
  let(:film_distributor) { FilmDistributor.new }

  it "must be valid" do
    value(film_distributor).must_be :valid?
  end
end
