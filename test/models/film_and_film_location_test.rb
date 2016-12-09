require "test_helper"

describe FilmAndFilmLocation do
  let(:film_and_film_location) { FilmAndFilmLocation.new }

  it "must be valid" do
    value(film_and_film_location).must_be :valid?
  end
end
