class Gallery < ApplicationRecord
    attr_accessor :city_name
    
    include Taggable
    include Searchable

    belongs_to :city, optional: true # TODO don't want this be optional - would like to add a location search for gallery
    belongs_to :organisation, optional: true
    belongs_to :studio, optional: true

    has_many :gallery_artists, dependent: :destroy
    has_many :artists, through: :gallery_artists

    has_many :gallery_exhibitions, dependent: :destroy
    has_many :exhibitions, through: :gallery_exhibitions
    
    has_many :opening_times, dependent: :destroy
    
    validates_presence_of :name

    scope :by_type, ->(gallery_class) { where('type ILIKE ?', "%#{gallery_class.to_s}%") }
    scope :artist, ->(artist) { joins(:artists).where(artists: artist) }

    def self.search(gallery)
        results = Geocoder.search(gallery)
    end
end