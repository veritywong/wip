class ArtBase < ApplicationRecord
    include Searchable
    include Attachable

    self.abstract_class = true
  
    has_one :art_work, as: :art, dependent: :destroy
    has_one :artist, through: :art_work
    has_many_attached :images

    scope :style, ->(art_style) { where(style: find_by_style(art_style).style)}

end