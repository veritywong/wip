class Movement < ApplicationRecord
    has_many :movement_artists
    has_many :artists, through: :movement_artists
end