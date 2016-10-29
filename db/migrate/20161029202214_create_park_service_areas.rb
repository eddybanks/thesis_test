class CreateParkServiceAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :park_service_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
