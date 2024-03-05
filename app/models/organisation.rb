class Organisation < ApplicationRecord
    belongs_to :city
    has_many :studios
    has_many :galleries
end