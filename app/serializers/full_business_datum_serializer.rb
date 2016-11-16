class FullBusinessDatumSerializer < ActiveModel::Serializer
  attributes :id, :locationid, :business_account_number, :ownership_name, :dba_name, :street_address, :city, :state, :source_zipcode, :business_start_date, :business_end_date, :location_start_date, :location_end_date, :mail_address, :mail_city, :mail_zipcode, :mail_state, :naics_code, :naics_code_description, :parking_tax, :transient_occupancy_tax, :lic_code, :lic_code_description, :supervisor_district, :neighborhoods, :business_corridor, :business_location
end
