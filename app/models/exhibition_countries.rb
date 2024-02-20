class ExhibitionCountries < ApplicationRecord
    belongs_to :exhibition
    belongs_to :country
end