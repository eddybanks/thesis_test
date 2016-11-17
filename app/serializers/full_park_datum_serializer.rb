class FullParkDatumSerializer < ActiveModel::Serializer
  attributes :id, :park_name, :park_type, :park_service_area, :psa_manager, :email, :number, :zipcode, :acreage, :sup_dist, :parkid, :location, :lat
end
