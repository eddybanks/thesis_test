class AddAddressToParkLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :park_locations, :address, :string
  end
end
