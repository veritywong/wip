class Gallery < ApplicationRecord
    has_many :gallery_countries
    has_many :countries, through: :gallery_countries

    has_many :gallery_exhibitions
    has_many :exhibitions, through: :gallery_exhibitions

    has_many :exhibition_artists
    has_many :artists, through: :exhibition_artists

    has_one :opening_time

    validates_presence_of :name, :address_line_1, :town, :postcode
end
