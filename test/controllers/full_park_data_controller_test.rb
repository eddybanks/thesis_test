require "test_helper"

describe FullParkDataController do
  let(:full_park_datum) { full_park_data :one }

  it "gets index" do
    get full_park_data_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_full_park_datum_url
    value(response).must_be :success?
  end

  it "creates full_park_datum" do
    expect {
      post full_park_data_url, params: { full_park_datum: { acreage: full_park_datum.acreage, email: full_park_datum.email, lat: full_park_datum.lat, location: full_park_datum.location, number: full_park_datum.number, park_name: full_park_datum.park_name, park_service_area: full_park_datum.park_service_area, park_type: full_park_datum.park_type, parkid: full_park_datum.parkid, psa_manager: full_park_datum.psa_manager, sup_dist: full_park_datum.sup_dist, zipcode: full_park_datum.zipcode } }
    }.must_change "FullParkDatum.count"

    must_redirect_to full_park_datum_path(FullParkDatum.last)
  end

  it "shows full_park_datum" do
    get full_park_datum_url(full_park_datum)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_full_park_datum_url(full_park_datum)
    value(response).must_be :success?
  end

  it "updates full_park_datum" do
    patch full_park_datum_url(full_park_datum), params: { full_park_datum: { acreage: full_park_datum.acreage, email: full_park_datum.email, lat: full_park_datum.lat, location: full_park_datum.location, number: full_park_datum.number, park_name: full_park_datum.park_name, park_service_area: full_park_datum.park_service_area, park_type: full_park_datum.park_type, parkid: full_park_datum.parkid, psa_manager: full_park_datum.psa_manager, sup_dist: full_park_datum.sup_dist, zipcode: full_park_datum.zipcode } }
    must_redirect_to full_park_datum_path(full_park_datum)
  end

  it "destroys full_park_datum" do
    expect {
      delete full_park_datum_url(full_park_datum)
    }.must_change "FullParkDatum.count", -1

    must_redirect_to full_park_data_path
  end
end
