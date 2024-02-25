class Artist < ApplicationRecord
    belongs_to :creatives, polymorphic: true
    has_many :countries, as: :placeable

    validates_presence_of :name, :description

end