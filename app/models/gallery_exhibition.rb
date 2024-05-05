class GalleryExhibition < ApplicationRecord
    belongs_to :gallery
    belongs_to :exhibition

    has_many :activities
    # validates_presence_of :start_date, :end_date
end