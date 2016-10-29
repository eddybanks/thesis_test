class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :acreage, :old_id
end
