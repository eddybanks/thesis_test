class CreateNaicsInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :naics_infos do |t|
      t.string :naics_code
      t.string :naics_code_description

      t.timestamps
    end
  end
end
