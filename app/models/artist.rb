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

    has_many :event_artists, dependent: :destroy
    has_many :events, through: :event_artists#, inverse_of: :artists

    # has_many :collection_entries, dependent: :destroy
    
    has_many_attached :images

    validates_presence_of :name

    def arts
        art_works = self.art_works
        art_works.map {|art_work| art_work.art}
    end

    def all_associations # is this even necessary? If searching the artist, would there be categories or filters to get this info?
        { events: Event.artist(self), 
          galleries: Gallery.artist(self), 
          arts: arts, 
          studio: studio,
          tags: tag_names
        }     
    end

end