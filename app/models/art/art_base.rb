class ArtBase < ApplicationRecord
    include Searchable
    include Attachable
    include ArtMediumable

    self.abstract_class = true
  
    has_one :art_work, as: :art, dependent: :destroy
    has_one :artist, through: :art_work
    has_many_attached :images

    has_many :art_medium_entries, as: :art_mediumable
    has_many :art_media, through: :art_medium_entries

    scope :style, ->(art_style) { where(style: find_by_style(art_style).style)}

    def add_art_medium(name)
        art_media << ArtMedium.find_or_create_by(name: name) # make this fuzzy?
    end
end