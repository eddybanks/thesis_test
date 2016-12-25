class Film < ApplicationRecord
  has_many :film_distributors
  has_many :production_companies
  has_many :distributors, through: :film_distributors
  has_many :production_companies, through: :film_production_companies
end
