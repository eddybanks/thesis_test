require "test_helper"

describe FilmAndFilmFunFact do
  let(:film_and_film_fun_fact) { FilmAndFilmFunFact.new }

  it "must be valid" do
    value(film_and_film_fun_fact).must_be :valid?
  end
end
