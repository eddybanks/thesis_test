class CreateFullBusinessData < ActiveRecord::Migration[5.0]
  def change
    create_table :full_business_data do |t|
      t.string :locationid
      t.string :business_account_number
      t.string :ownership_name
      t.string :dba_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :source_zipcode
      t.string :business_start_date
      t.string :business_end_date
      t.string :location_start_date
      t.string :location_end_date
      t.string :mail_address
      t.string :mail_city
      t.string :mail_zipcode
      t.string :mail_state
      t.string :naics_code
      t.string :naics_code_description
      t.string :parking_tax
      t.string :transient_occupancy_tax
      t.string :lic_code
      t.string :lic_code_description
      t.string :supervisor_district
      t.string :neighborhoods
      t.string :business_corridor
      t.string :business_location

      t.timestamps
    end
  end
end
