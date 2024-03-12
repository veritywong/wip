class Artist < ApplicationRecord
    include Taggable
    include Searchable

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

    has_many_attached :images

    validates_presence_of :name

    def self.art_by(name)
        artist = find_artist_by_name(name)
        {paiings: artist.paintings, installations: artist.installations}  if artist
    end

    def find_all_associations
        { exhibitions: Exhibition.artist(self), 
          galleries: Gallery.artist(self), 
          paintings: paintings, 
          installations: installations, 
          studio: studio,
          tags: tag_names
        }     
    end

end