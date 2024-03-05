class ArtBase < ApplicationRecord
    self.abstract_class = true
  
    has_one :art_work, as: :art, dependent: :destroy
    has_one :artist, through: :art_work
end