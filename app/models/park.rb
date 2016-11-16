class Park < ApplicationRecord
  has_many :park_locations

  paginates_per 20
end
