class GalleryExhibition < ApplicationRecord
    belongs_to :gallery, polymorphic: true
    belongs_to :exhibition

    # validates_presence_of :start_date, :end_date
end