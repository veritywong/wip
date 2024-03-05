class Gallery < ApplicationRecord
    include Taggable

    belongs_to :city
    belongs_to :organisation

    has_many :gallery_artists, dependent: :destroy
    has_many :artists, through: :gallery_artists

    has_many :gallery_exhibitions, dependent: :destroy
    has_many :exhibitions, through: :gallery_exhibitions
    
    has_many :opening_times, dependent: :destroy
    
    # validates_presence_of :name, :address_line_1, :postcode

    scope :by_type, ->(gallery_class) { where(type: gallery_class.name) }
end