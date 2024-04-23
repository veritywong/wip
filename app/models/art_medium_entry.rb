class ArtMediumEntry < ApplicationRecord
    belongs_to :art_mediumable, polymorphic: true
    belongs_to :art_medium

end