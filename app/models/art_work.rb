class ArtWork < ApplicationRecord
    include Taggable

    belongs_to :artist
    belongs_to :art, polymorphic: true, dependent: :destroy
   
    def art
        art_type.constantize.find_by(id: art_id)
    end
end