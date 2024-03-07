class ArtBase < ApplicationRecord
    self.abstract_class = true
    include PgSearch::Model
  
    has_one :art_work, as: :art, dependent: :destroy
    has_one :artist, through: :art_work

    scope :style, ->(art_style) { where(style: find_by_style(art_style).style)}

    def self.find_by_style(art_style)
        where('dmetaphone(style) = dmetaphone(?)', "#{art_style}").first
    end
end