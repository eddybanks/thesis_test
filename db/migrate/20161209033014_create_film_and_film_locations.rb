class CreateFilmAndFilmLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :film_and_film_locations do |t|
      t.belongs_to :film, foreign_key: true
      t.belongs_to :film_location, foreign_key: true

      t.timestamps
    end
  end
end
