class City < ApplicationRecord
    belongs_to :country
    #has_many :gallery_bases
    
    has_many :artist_cities
    has_many :artists, through: :artist_cities

end