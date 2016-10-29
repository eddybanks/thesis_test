class AddLatitudeAndLongitudeToParkLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :park_locations, :latitude, :float
    add_column :park_locations, :longitude, :float
  end
end
