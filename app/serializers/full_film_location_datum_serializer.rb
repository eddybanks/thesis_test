class FullFilmLocationDatumSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :locations, :fun_facts, :production_company, :distributor, :director, :writer, :actor1, :actor2, :actor3
end
