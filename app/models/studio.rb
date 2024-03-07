class Studio < ApplicationRecord
    belongs_to :organisation, optional: true
    has_many :artists
    has_one :gallery
end