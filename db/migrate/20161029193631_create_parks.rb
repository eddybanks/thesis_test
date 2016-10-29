class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :acreage
      t.integer :old_id

      t.timestamps
    end
  end
end
