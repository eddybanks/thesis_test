class CreateFilmAndFilmFunFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :film_and_film_fun_facts do |t|
      t.belongs_to :film, foreign_key: true
      t.belongs_to :film_fun_fact, foreign_key: true

      t.timestamps
    end
  end
end
