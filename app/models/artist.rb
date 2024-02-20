class Artist < ApplicationRecord#
    has_many :gallery_artists
    has_many :galleries, through :gallery_artists

    has_many :exhibition_artists
    has_many :exhibitions, through :exhibition_artists

    has_many :artist_countries
    has_many :countries, through: :artist_countries

    validates_presence_of :name, :description

end