class ArtWork < ApplicationRecord
    include Taggable

    belongs_to :artist
    belongs_to :art, polymorphic: true, dependent: :destroy
   
end