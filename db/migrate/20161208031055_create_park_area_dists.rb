class CreateParkAreaDists < ActiveRecord::Migration[5.0]
  def change
    create_table :park_area_dists do |t|
      t.string :park_service_area
      t.integer :sup_dist

      t.timestamps
    end
  end
end
