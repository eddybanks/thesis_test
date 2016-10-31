class AddParksToParkLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :park_locations, :park, foreign_key: true
  end
end
