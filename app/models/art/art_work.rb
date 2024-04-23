class ArtWork < ApplicationRecord
    include Taggable
    include Searchable

    belongs_to :artist
    belongs_to :art, polymorphic: true, dependent: :destroy

    has_many_attached :images

    scope :by_artist_name, ->(artist_name) { joins(:artist).where(artist: Artist.fuzzy_search(:name, artist_name))} 
    scope :artist, ->(artist) { joins(:artist).where(artist: artist) }

    def self.artist_name_with_joins
        self.joins(:artist).each do |art_work|
            puts art_work.artist.name
        end
    end

    def self.artist_name_no_join
        self.all.each do |art_work|
            puts art_work.artist.name
        end
    end

end