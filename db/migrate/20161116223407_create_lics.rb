class CreateLics < ActiveRecord::Migration[5.0]
  def change
    create_table :lics do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
