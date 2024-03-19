class Artist < ApplicationRecord
    include Taggable
    include Searchable
    include Attachable

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

    has_many :collection_artists
    has_many :collections, through: :collection_artists
    
    has_many :movement_artists
    has_many :movements, through: :movement_artists
    
    has_many_attached :images

    validates_presence_of :name

    def self.art_by(name)
        artist = fuzzy_search(:name, name)
        {paintings: artist.paintings, installations: artist.installations}  if artist
    end

    def all_associations
        { exhibitions: Exhibition.artist(self), 
          galleries: Gallery.artist(self), 
          paintings: paintings, 
          installations: installations, 
          studio: studio,
          tags: tag_names
        }     
    end

end