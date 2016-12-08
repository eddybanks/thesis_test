class AddPsaManagersToPark < ActiveRecord::Migration[5.0]
  def change
    add_reference :parks, :psa_manager, foreign_key: true
  end
end
