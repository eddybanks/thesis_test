class CreateFilmLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :film_locations do |t|
      t.string :location

      t.timestamps
    end
  end
end
