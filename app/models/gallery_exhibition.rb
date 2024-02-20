class GalleryExhibition < ApplicationRecord
    belongs_to :gallery
    belongs_to :exhibition
end