class ArtistCity < ApplicationRecord
    belongs_to :city
    belongs_to :artist
end