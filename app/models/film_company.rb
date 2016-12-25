class FilmCompany < ApplicationRecord
  has_many :film_distributors
  has_many :film_production_companies
  has_many :films, through: :film_distributors, as: :distributors, source: :film
  has_many :films, through: :film_production_companies, as: :production_companies
end
