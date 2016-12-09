class AddParkPsaManagerToPark < ActiveRecord::Migration[5.0]
  def change
    add_reference :parks, :park_psa_manager, foreign_key: true
  end
end
