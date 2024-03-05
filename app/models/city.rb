class City < ApplicationRecord
    belongs_to :country
    has_many :galleries, dependent: :destroy
    
    has_many :artist_cities, dependent: :destroy
    has_many :artists, through: :artist_cities

end