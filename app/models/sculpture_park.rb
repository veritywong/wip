class SculpturePark < ApplicationRecord
    belongs_to :city
    has_many :gallery_artists
    has_many :artists, through: :gallery_artists

    has_many :gallery_cities
    has_many :cities, through: :gallery_cities
    
    has_many :opening_times    
    
    # validates_presence_of :name, :address_line_1, :town, :postcode

end