require "test_helper"

describe FilmProductionCompany do
  let(:film_production_company) { FilmProductionCompany.new }

  it "must be valid" do
    value(film_production_company).must_be :valid?
  end
end
