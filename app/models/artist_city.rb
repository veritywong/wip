class ArtistCity < ApplicationRecord
    belongs_to :city
    belongs_to :artist

    # enum period: {birth_place: 0, study: 1, current: 2, main: 3} # more encylopedia not necessary for this app
    # booleans, birthplace, influential, study, lived, add notes column - dates they lived there. 
    # who is entering this data ? Do you just want to link this to wikipedia? 
    # what is the goal of this application

    # could just have dates and notes
    # do you want a button that generates a bio on the artist?
    # are there any apis for visual artists?

end