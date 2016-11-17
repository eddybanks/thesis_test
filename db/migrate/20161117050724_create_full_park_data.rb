class CreateFullParkData < ActiveRecord::Migration[5.0]
  def change
    create_table :full_park_data do |t|
      t.string :park_name
      t.string :park_type
      t.string :park_service_area
      t.string :psa_manager
      t.string :email
      t.string :number
      t.string :zipcode
      t.float :acreage
      t.integer :sup_dist
      t.integer :parkid
      t.string :location
      t.string :lat

      t.timestamps
    end
  end
end
