class Activity < ApplicationRecord
include Attachable
    belongs_to :gallery_exhibition, optional: true
    has_many :collection_entries, as: :collectionable
    has_many_attached :images, dependent: :purge_later 
    # need to extend images, create images model and images belong to 
    
    validates_presence_of :name
    
end