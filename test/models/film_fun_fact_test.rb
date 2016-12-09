require "test_helper"

describe FilmFunFact do
  let(:film_fun_fact) { FilmFunFact.new }

  it "must be valid" do
    value(film_fun_fact).must_be :valid?
  end
end
