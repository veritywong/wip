class City < ApplicationRecord
    belongs_to :country
    has_many :galleries
    
    has_many :artist_cities
    has_many :artists, through: :artist_cities

end