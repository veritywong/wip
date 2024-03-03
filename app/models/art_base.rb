class ArtBase < ApplicationRecord
    self.abstract_class = true
  
    has_one :art_work, as: :art
end