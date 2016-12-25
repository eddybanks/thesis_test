class CreateFilmDistributors < ActiveRecord::Migration[5.0]
  def change
    create_table :film_distributors do |t|
      t.belongs_to :film, foreign_key: true
      t.belongs_to :film_company, foreign_key: true

      t.timestamps
    end
  end
end
