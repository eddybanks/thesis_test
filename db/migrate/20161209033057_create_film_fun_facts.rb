class CreateFilmFunFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :film_fun_facts do |t|
      t.text :fun_fact

      t.timestamps
    end
  end
end
