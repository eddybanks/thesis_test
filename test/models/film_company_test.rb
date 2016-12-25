require "test_helper"

describe FilmCompany do
  let(:film_company) { FilmCompany.new }

  it "must be valid" do
    value(film_company).must_be :valid?
  end
end
