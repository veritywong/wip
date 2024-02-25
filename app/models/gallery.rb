class Gallery < ApplicationRecord
    has_many :countries, as: :placeable
    has_many :artists, as :creatives

    has_many :gallery_exhibitions
    has_many :exhibitions, through: :gallery_exhibitions

    has_one :opening_time

    validates_presence_of :name, :address_line_1, :town, :postcode
end
