class ExhibitionArtWork < ApplicationRecord
    belongs_to :exhibition
    belongs_to :art_work
end