class Collection < ApplicationRecord
    has_many :collection_events
    has_many :events, through: :collection_events
    has_many :collection_artists
    has_many :artists, through: :collection_artists
    
    # validates_presence_of :name, :description, :notes
    def all_in_collection
        [self.events, self.artists]
    end
end