require "test_helper"

describe ParksController do
  let(:park) { parks :one }

  it "gets index" do
    get parks_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_park_url
    value(response).must_be :success?
  end

  it "creates park" do
    expect {
      post parks_url, params: { park: { acreage: park.acreage, name: park.name, old_id: park.old_id } }
    }.must_change "Park.count"

    must_redirect_to park_path(Park.last)
  end

  it "shows park" do
    get park_url(park)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_park_url(park)
    value(response).must_be :success?
  end

  it "updates park" do
    patch park_url(park), params: { park: { acreage: park.acreage, name: park.name, old_id: park.old_id } }
    must_redirect_to park_path(park)
  end

  it "destroys park" do
    expect {
      delete park_url(park)
    }.must_change "Park.count", -1

    must_redirect_to parks_path
  end
end
