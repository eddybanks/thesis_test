require "test_helper"

describe FullBusinessDataController do
  let(:full_business_datum) { full_business_data :one }

  it "gets index" do
    get full_business_data_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_full_business_datum_url
    value(response).must_be :success?
  end

  it "creates full_business_datum" do
    expect {
      post full_business_data_url, params: { full_business_datum: { business_account_number: full_business_datum.business_account_number, business_corridor: full_business_datum.business_corridor, business_end_date: full_business_datum.business_end_date, business_location: full_business_datum.business_location, business_start_date: full_business_datum.business_start_date, city: full_business_datum.city, dba_name: full_business_datum.dba_name, lic_code: full_business_datum.lic_code, lic_code_description: full_business_datum.lic_code_description, location_end_date: full_business_datum.location_end_date, location_start_date: full_business_datum.location_start_date, locationid: full_business_datum.locationid, mail_address: full_business_datum.mail_address, mail_city: full_business_datum.mail_city, mail_state: full_business_datum.mail_state, mail_zipcode: full_business_datum.mail_zipcode, naics_code: full_business_datum.naics_code, naics_code_description: full_business_datum.naics_code_description, neighborhoods: full_business_datum.neighborhoods, ownership_name: full_business_datum.ownership_name, parking_tax: full_business_datum.parking_tax, source_zipcode: full_business_datum.source_zipcode, state: full_business_datum.state, street_address: full_business_datum.street_address, supervisor_district: full_business_datum.supervisor_district, transient_occupancy_tax: full_business_datum.transient_occupancy_tax } }
    }.must_change "FullBusinessDatum.count"

    must_redirect_to full_business_datum_path(FullBusinessDatum.last)
  end

  it "shows full_business_datum" do
    get full_business_datum_url(full_business_datum)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_full_business_datum_url(full_business_datum)
    value(response).must_be :success?
  end

  it "updates full_business_datum" do
    patch full_business_datum_url(full_business_datum), params: { full_business_datum: { business_account_number: full_business_datum.business_account_number, business_corridor: full_business_datum.business_corridor, business_end_date: full_business_datum.business_end_date, business_location: full_business_datum.business_location, business_start_date: full_business_datum.business_start_date, city: full_business_datum.city, dba_name: full_business_datum.dba_name, lic_code: full_business_datum.lic_code, lic_code_description: full_business_datum.lic_code_description, location_end_date: full_business_datum.location_end_date, location_start_date: full_business_datum.location_start_date, locationid: full_business_datum.locationid, mail_address: full_business_datum.mail_address, mail_city: full_business_datum.mail_city, mail_state: full_business_datum.mail_state, mail_zipcode: full_business_datum.mail_zipcode, naics_code: full_business_datum.naics_code, naics_code_description: full_business_datum.naics_code_description, neighborhoods: full_business_datum.neighborhoods, ownership_name: full_business_datum.ownership_name, parking_tax: full_business_datum.parking_tax, source_zipcode: full_business_datum.source_zipcode, state: full_business_datum.state, street_address: full_business_datum.street_address, supervisor_district: full_business_datum.supervisor_district, transient_occupancy_tax: full_business_datum.transient_occupancy_tax } }
    must_redirect_to full_business_datum_path(full_business_datum)
  end

  it "destroys full_business_datum" do
    expect {
      delete full_business_datum_url(full_business_datum)
    }.must_change "FullBusinessDatum.count", -1

    must_redirect_to full_business_data_path
  end
end
