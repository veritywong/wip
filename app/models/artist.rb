class Artist < ApplicationRecord
    include Taggable
    include PgSearch::Model

    belongs_to :studio, optional: true

    has_many :art_works, dependent: :destroy
    has_many :paintings, through: :art_works, source: :art, source_type: 'Painting'
    has_many :installations, through: :art_works, source: :art, source_type: 'Installation'

    has_many :artist_cities, dependent: :destroy
    has_many :cities, through: :artist_cities

    has_many :gallery_artists, dependent: :destroy
    has_many :galleries, through: :gallery_artists

    has_many :exhibition_artists, dependent: :destroy
    has_many :exhibitions, through: :exhibition_artists

    # scope :art_works, ->(artist_name) { joins(:art_works).where('artists.name' => artist_name)} # DONE make it fuzzy. Find artist then pass that into the scope
    # scope :art_works, ->(artist_name) { joins(:art_works).where(art_works: {artist: find_artist(artist_name)})} 
    scope :art_works, ->(artist_name) { joins(:art_works).where('art_works.artist' => find_artist(artist_name))} # same as above different syntax

    pg_search_scope :kinda_spelled_like,
                    :against => :name,
                    :using => :trigram

    # validates_presence_of :name, :description, :discipline to: :exhibition_artist # painter, printing, sculpture 

    def self.find_artist(artist_name)
        # where('name ILIKE ?', "%#{name}%").first
        where('dmetaphone(name) = dmetaphone(?)', "#{artist_name}").first
    end
end