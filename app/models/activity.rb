class Activity < ApplicationRecord
include Attachable
    belongs_to :event, optional: true
    has_many :collection_entries, as: :collectionable
    # has_many_attached :images, dependent: :purge_later
    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
    # need to extend images, create images model and images belong to 
    
    validates_presence_of :name
    
end