require "test_helper"

describe FilmLocation do
  let(:film_location) { FilmLocation.new }

  it "must be valid" do
    value(film_location).must_be :valid?
  end
end
