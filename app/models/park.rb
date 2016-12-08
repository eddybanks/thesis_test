class Park < ApplicationRecord
  belongs_to :park_location
  belongs_to :psa_manager
  belongs_to :park_area_dist

  paginates_per 20
end
