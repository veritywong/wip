class ArtMediumEntry < ApplicationRecord
    belongs_to :art_mediumable, polymorphic: true
    belongs_to :art_medium

    def art_mediumable
        art_mediumable_type.constantize.find_by(id: art_mediumable_id)
    end
end