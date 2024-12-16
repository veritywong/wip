class Location < ApplicationRecord
    attr_accessor :city_name
    
    include Taggable
    include Searchable

    belongs_to :city, optional: true # TODO don't want this be optional - would like to add a location search for location
    belongs_to :organisation, optional: true
    belongs_to :studio, optional: true

    has_many :events
    has_many :location_artists, dependent: :destroy
    has_many :artists, through: :location_artists
    has_many :opening_times, dependent: :destroy
    
    validates_presence_of :name

    scope :by_type, ->(location_class) { where('type ILIKE ?', "%#{location_class.to_s}%") }
    scope :artist, ->(artist) { joins(:artists).where(artists: artist) }

    def self.search(location)
        results = Geocoder.search(location)
    end
end