class CreateFullFilmLocationData < ActiveRecord::Migration[5.0]
  def change
    create_table :full_film_location_data do |t|
      t.string :title
      t.integer :release_year
      t.string :locations
      t.text :fun_facts
      t.string :production_company
      t.string :distributor
      t.string :director
      t.string :writer
      t.string :actor1
      t.string :actor2
      t.string :actor3

      t.timestamps
    end
  end
end
