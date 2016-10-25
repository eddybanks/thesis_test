require "test_helper"

describe BusinessesController do
  let(:business) { businesses :one }

  it "gets index" do
    get businesses_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_business_url
    value(response).must_be :success?
  end

  it "creates business" do
    expect {
      post businesses_url, params: { business: { account_number: business.account_number, end_data: business.end_data, naics_code: business.naics_code, naics_code_description: business.naics_code_description, ownership_name: business.ownership_name, start_date: business.start_date } }
    }.must_change "Business.count"

    must_redirect_to business_path(Business.last)
  end

  it "shows business" do
    get business_url(business)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_business_url(business)
    value(response).must_be :success?
  end

  it "updates business" do
    patch business_url(business), params: { business: { account_number: business.account_number, end_data: business.end_data, naics_code: business.naics_code, naics_code_description: business.naics_code_description, ownership_name: business.ownership_name, start_date: business.start_date } }
    must_redirect_to business_path(business)
  end

  it "destroys business" do
    expect {
      delete business_url(business)
    }.must_change "Business.count", -1

    must_redirect_to businesses_path
  end
end
