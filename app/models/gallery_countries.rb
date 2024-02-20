class GalleryCountries < ApplicationRecord
    belongs_to :gallery
    belongs_to :country
end