class Event < ApplicationRecord
include Attachable
    belongs_to :exhibition, optional: true
    has_many :collection_events
    has_many :collections, through: :collection_events
    has_many_attached :images

    # validates_presence_of :name, :description, :note, :scheduled_at, :completed_at
    # could be a visit to an exhibition, an artist date, a walk
end