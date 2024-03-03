class Artist < ApplicationRecord
    has_many :art_works
    has_many :paintings, through: :art_works, source: :art, source_type: 'Painting'
    has_many :installations, through: :art_works, source: :art, source_type: 'Installation'

    has_many :artist_cities
    has_many :cities, through: :artist_cities

    has_many :gallery_artists
    has_many :galleries, through: :gallery_artists

    has_many :exhibition_artists
    has_many :exhibitions, through: :exhibition_artists

    # validates_presence_of :name, :description, :discipline to: :exhibition_artist # painter, printing, sculpture 

end