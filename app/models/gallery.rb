class Gallery < ApplicationRecord
    include Taggable

    belongs_to :city
    belongs_to :organisation, optional: true
    belongs_to :studio, optional: true

    has_many :gallery_artists, dependent: :destroy
    has_many :artists, through: :gallery_artists

    has_many :gallery_exhibitions, dependent: :destroy
    has_many :exhibitions, through: :gallery_exhibitions
    
    has_many :opening_times, dependent: :destroy
    
    # validates_presence_of :name, :address_line_1, :postcode

    scope :by_type, ->(gallery_class) { where('type ILIKE ?', "%#{gallery_class.to_s}%") } # DONE could handle the argument as a string or a class, turn object into a string .to_s, also allow from not capitalized args. Could make this fuzzy


end