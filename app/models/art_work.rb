class ArtWork < ApplicationRecord
    include Taggable
    include Searchable

    belongs_to :artist
    belongs_to :art, polymorphic: true, dependent: :destroy

    has_many_attached :images

    scope :by_artist_name, ->(artist_name) { joins(:artist).where(artist: find_artist_by_name(artist_name))} 
    scope :artist, ->(artist) { joins(:artist).where(artist: artist) }

end