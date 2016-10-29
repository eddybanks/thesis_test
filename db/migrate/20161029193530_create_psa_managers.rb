class CreatePsaManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :psa_managers do |t|
      t.string :name
      t.string :email
      t.string :number

      t.timestamps
    end
  end
end
