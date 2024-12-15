class EventArtWork < ApplicationRecord
    belongs_to :event
    belongs_to :art_work
end