require "test_helper"

describe LocationsController do
  let(:location) { locations :one }

  it "gets index" do
    get locations_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_location_url
    value(response).must_be :success?
  end

  it "creates location" do
    expect {
      post locations_url, params: { location: { description: location.description, name: location.name } }
    }.must_change "Location.count"

    must_redirect_to location_path(Location.last)
  end

  it "shows location" do
    get location_url(location)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_location_url(location)
    value(response).must_be :success?
  end

  it "updates location" do
    patch location_url(location), params: { location: { description: location.description, name: location.name } }
    must_redirect_to location_path(location)
  end

  it "destroys location" do
    expect {
      delete location_url(location)
    }.must_change "Location.count", -1

    must_redirect_to locations_path
  end
end
