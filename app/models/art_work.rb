class ArtWork < ApplicationRecord
    include Taggable

    belongs_to :artist
    belongs_to :art, polymorphic: true, dependent: :destroy
   
    # find art work by style
    scope :style, ->(style) { joins(:art)}
end