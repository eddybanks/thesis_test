class CreateParkZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :park_zipcodes do |t|
      t.integer :code

      t.timestamps
    end
  end
end
