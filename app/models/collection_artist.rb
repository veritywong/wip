class CollectionArtist < ApplicationRecord
    belongs_to :collection
    belongs_to :artist
end