class Organisation < ApplicationRecord
    belongs_to :city
    has_many :studios
    has_many :galleries
    has_many :opportunities
end