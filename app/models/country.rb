class Country < ApplicationRecord
    has_many :gallery_countries
    has_many :galleries, through: :gallery_countries

    has_many :exhibition_countires
    has_many :exhibitions, through: :exhibition_countires

    has_many :artist_countries
    has_many :artists through, :artist_countries
    
    validates_presence_of :name, :country_code
    validates_uniqueness_of :country_code

end