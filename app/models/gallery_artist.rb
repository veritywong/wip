class LocationArtist < ApplicationRecord
    belongs_to :location
    belongs_to :artist
end