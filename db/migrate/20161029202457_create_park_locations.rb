class CreateParkLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :park_locations do |t|
      t.integer :zipcode

      t.timestamps
    end
  end
end
