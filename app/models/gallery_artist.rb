class GalleryArtist < ApplicationRecord
    belongs_to :gallery, polymorphic: true
    belongs_to :artist
end