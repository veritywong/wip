class ArtistCountries < ApplicationRecord
    belongs_to :artist
    belongs_to :country
end