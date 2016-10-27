class RemoveColumnsFromBusinesses < ActiveRecord::Migration[5.0]
  def change
    remove_column :businesses, :naics_code, :string
    remove_column :businesses, :naics_code_description, :string
  end
end
