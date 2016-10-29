require "test_helper"

describe PsaManagersController do
  let(:psa_manager) { psa_managers :one }

  it "gets index" do
    get psa_managers_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_psa_manager_url
    value(response).must_be :success?
  end

  it "creates psa_manager" do
    expect {
      post psa_managers_url, params: { psa_manager: { email: psa_manager.email, name: psa_manager.name, number: psa_manager.number } }
    }.must_change "PsaManager.count"

    must_redirect_to psa_manager_path(PsaManager.last)
  end

  it "shows psa_manager" do
    get psa_manager_url(psa_manager)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_psa_manager_url(psa_manager)
    value(response).must_be :success?
  end

  it "updates psa_manager" do
    patch psa_manager_url(psa_manager), params: { psa_manager: { email: psa_manager.email, name: psa_manager.name, number: psa_manager.number } }
    must_redirect_to psa_manager_path(psa_manager)
  end

  it "destroys psa_manager" do
    expect {
      delete psa_manager_url(psa_manager)
    }.must_change "PsaManager.count", -1

    must_redirect_to psa_managers_path
  end
end
