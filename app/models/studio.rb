class Studio < ApplicationRecord
    has_one :organisation
    has_many :artists
end