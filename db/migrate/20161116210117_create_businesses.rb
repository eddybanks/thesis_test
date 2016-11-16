class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.integer :account_number
      t.string :ownership_name

      t.timestamps
    end
  end
end
