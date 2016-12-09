class FilmAndFilmLocation < ApplicationRecord
  belongs_to :film
  belongs_to :film_location
end
