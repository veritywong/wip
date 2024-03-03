class Gallery < ApplicationRecord
    belongs_to :city

    has_many :gallery_artists
    has_many :artists, through: :gallery_artists
    
    has_many :opening_times
    
    # validates_presence_of :name, :address_line_1, :postcode

    scope :by_type, ->(gallery_class) { where(type: gallery_class.name) }
end