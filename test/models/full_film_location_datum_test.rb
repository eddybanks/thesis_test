require "test_helper"

describe FullFilmLocationDatum do
  let(:full_film_location_datum) { FullFilmLocationDatum.new }

  it "must be valid" do
    value(full_film_location_datum).must_be :valid?
  end
end
