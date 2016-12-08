class AddParkAreaDistToPark < ActiveRecord::Migration[5.0]
  def change
    add_reference :parks, :park_area_dist, foreign_key: true
  end
end
