require "test_helper"

describe FullFilmLocationDataController do
  let(:full_film_location_datum) { full_film_location_data :one }

  it "gets index" do
    get full_film_location_data_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_full_film_location_datum_url
    value(response).must_be :success?
  end

  it "creates full_film_location_datum" do
    expect {
      post full_film_location_data_url, params: { full_film_location_datum: { actor1: full_film_location_datum.actor1, actor2: full_film_location_datum.actor2, actor3: full_film_location_datum.actor3, director: full_film_location_datum.director, distributor: full_film_location_datum.distributor, fun_facts: full_film_location_datum.fun_facts, locations: full_film_location_datum.locations, production_company: full_film_location_datum.production_company, release_year: full_film_location_datum.release_year, title: full_film_location_datum.title, writer: full_film_location_datum.writer } }
    }.must_change "FullFilmLocationDatum.count"

    must_redirect_to full_film_location_datum_path(FullFilmLocationDatum.last)
  end

  it "shows full_film_location_datum" do
    get full_film_location_datum_url(full_film_location_datum)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_full_film_location_datum_url(full_film_location_datum)
    value(response).must_be :success?
  end

  it "updates full_film_location_datum" do
    patch full_film_location_datum_url(full_film_location_datum), params: { full_film_location_datum: { actor1: full_film_location_datum.actor1, actor2: full_film_location_datum.actor2, actor3: full_film_location_datum.actor3, director: full_film_location_datum.director, distributor: full_film_location_datum.distributor, fun_facts: full_film_location_datum.fun_facts, locations: full_film_location_datum.locations, production_company: full_film_location_datum.production_company, release_year: full_film_location_datum.release_year, title: full_film_location_datum.title, writer: full_film_location_datum.writer } }
    must_redirect_to full_film_location_datum_path(full_film_location_datum)
  end

  it "destroys full_film_location_datum" do
    expect {
      delete full_film_location_datum_url(full_film_location_datum)
    }.must_change "FullFilmLocationDatum.count", -1

    must_redirect_to full_film_location_data_path
  end
end
