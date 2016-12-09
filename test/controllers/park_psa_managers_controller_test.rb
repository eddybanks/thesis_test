require "test_helper"

describe ParkPsaManagersController do
  let(:park_psa_manager) { park_psa_managers :one }

  it "gets index" do
    get park_psa_managers_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_park_psa_manager_url
    value(response).must_be :success?
  end

  it "creates park_psa_manager" do
    expect {
      post park_psa_managers_url, params: { park_psa_manager: { email: park_psa_manager.email, name: park_psa_manager.name, number: park_psa_manager.number } }
    }.must_change "ParkPsaManager.count"

    must_redirect_to park_psa_manager_path(ParkPsaManager.last)
  end

  it "shows park_psa_manager" do
    get park_psa_manager_url(park_psa_manager)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_park_psa_manager_url(park_psa_manager)
    value(response).must_be :success?
  end

  it "updates park_psa_manager" do
    patch park_psa_manager_url(park_psa_manager), params: { park_psa_manager: { email: park_psa_manager.email, name: park_psa_manager.name, number: park_psa_manager.number } }
    must_redirect_to park_psa_manager_path(park_psa_manager)
  end

  it "destroys park_psa_manager" do
    expect {
      delete park_psa_manager_url(park_psa_manager)
    }.must_change "ParkPsaManager.count", -1

    must_redirect_to park_psa_managers_path
  end
end
