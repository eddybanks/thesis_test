class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :account_number
      t.string :ownership_name
      t.date :start_date
      t.date :end_date
      t.string :naics_code
      t.string :naics_code_description

      t.timestamps
    end
  end
end
