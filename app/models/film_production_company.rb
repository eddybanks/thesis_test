class FilmProductionCompany < ApplicationRecord
  belongs_to :film
  belongs_to :film_company
end
