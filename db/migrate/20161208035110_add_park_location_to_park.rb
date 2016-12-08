class AddParkLocationToPark < ActiveRecord::Migration[5.0]
  def change
    add_reference :parks, :park_location, foreign_key: true
  end
end
