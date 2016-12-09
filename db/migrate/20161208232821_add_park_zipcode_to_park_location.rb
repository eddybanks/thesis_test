class AddParkZipcodeToParkLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :park_locations, :park_zipcode, foreign_key: true
  end
end
