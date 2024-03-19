class ArtistCity < ApplicationRecord
    belongs_to :city
    belongs_to :artist

    enum period: {birth_place: 0, early_years: 1, study: 2, current: 3, main: 4}

end