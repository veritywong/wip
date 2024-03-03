# This file should ensure the existence of records required to run the application in every environment (production,tate
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# change seed files so that the variable names are more obvious
# Create exhibitions
out_of_earth = Exhibition.create(title: 'Out of Earth')
infinity_mirror = Exhibition.create(title: 'Infinity Mirror Rooms')
behind_the_red_moon = Exhibition.create(title: 'Behind the Red Moon')
sea_and_space = Exhibition.create(title: 'Sea and Space')

# Create countries
england  = Country.create(name: 'England', country_code: 'en')
america = Country.create(name: 'United States of America', country_code: 'us')
ghana = Country.create(name: 'Ghana', country_code: 'gh')
japan = Country.create(name: 'Japan', country_code: 'jp')
nigeria = Country.create(name: 'Nigeria', country_code: 'ng')

# Create cities
london = City.create(name: 'London', country: england)
new_york = City.create(name: 'New York', country: america)
los_angelese = City.create(name: 'Los Angeles', country: america)
hudson = City.create(name: 'Hudson', country: america)
anyako = City.create(name: 'Anyako', country: ghana)
nsukka = City.create(name: 'Nsukka', country: nigeria)
tokyo = City.create(name: 'Tokyo', country: japan)

# Create galleries

tate = Gallery.create(city: london, type: 'Museum', name: 'Tate Modern') #
gagosian = Gallery.create(city: new_york, type: 'Museum', name: 'Gagosian') #
approach = Gallery.create(city: london, type: 'CommercialSpace', name: 'The Approach') #

# create artists
bill_lynch = Artist.create(name: 'Bill Lynch', description: 'Influenced by chinese brush painting, painted on found wood.')
ellen_siebers = Artist.create(name: 'Ellen Siebers', description: 'exhibited with bill lynch.')
mary_weatherford = Artist.create(name: 'Mary Weatherford', description: 'has a show on at the gagosian.')
el_anatsui = Artist.create(name: 'El Anatsui', description: 'More of a weaver as well')
yayoi_kusama = Artist.create(name: 'Yayoi Kusama', description: 'Creates installations with sculptures')

# create installations
chandalier_of_grief = Installation.create(name: 'Chandelier of Grief', date_of_creation: '2016', medium_1: 'chandelier', medium_2: 'steel', medium_3: 'mirrored glass', medium_4: 'acrylic', medium_5: 'motor', medium_6: 'plastic')
infinity_mirrored_room = Installation.create(name: 'nfinity Mirrored Room – Filled with the Brilliance of Life', date_of_creation: '2011', medium_1: 'mirrored glass', medium_2: 'wood', medium_3: 'aluminium', medium_4: 'plastic', medium_5: 'ceramic', medium_6: 'leds')
red_moon = Installation.create(name: 'Behind the Red Moon', date_of_creation: '2023', medium_1: 'bottle tops', medium_2: 'copper wire')

# create paintings = 
branch_leaves = Painting.create(name: 'No title [Branch, Leaves in Center of Painting]', date_of_creation: '1990-2005', medium_1: 'oil', support: 'salvage wood')
redons_poppy = Painting.create(name: "Redon's poppy", date_of_creation: '2023', medium_1: 'oil', support: 'birch panel')
celadon_anemone = Painting.create(name: 'Celadon Anemone', date_of_creation: '2023', medium_1: 'flashe', support: 'linen')

#create art work
art_work1 = ArtWork.create(art: chandalier_of_grief, artist: yayoi_kusama) 
art_work2 = ArtWork.create(art: infinity_mirrored_room, artist: yayoi_kusama) 
art_work3 = ArtWork.create(art: red_moon, artist: el_anatsui) 
art_work4 = ArtWork.create(art: branch_leaves, artist: bill_lynch) 
art_work5 = ArtWork.create(art: redons_poppy, artist: ellen_siebers) 
art_work6 = ArtWork.create(art: celadon_anemone, artist: mary_weatherford) 

ExhibitionArtWork.create(exhibition: infinity_mirror, art_work: art_work1)
ExhibitionArtWork.create(exhibition: out_of_earth, art_work: art_work4)
ExhibitionArtWork.create(exhibition: out_of_earth, art_work: art_work5)
ExhibitionArtWork.create(exhibition: behind_the_red_moon, art_work: art_work3)
ExhibitionArtWork.create(exhibition: sea_and_space, art_work: art_work5)

# create artist_cities
ArtistCity.create(artist: bill_lynch, city: new_york)
ArtistCity.create(artist: ellen_siebers, city: hudson)
ArtistCity.create(artist: mary_weatherford, city: los_angelese)
ArtistCity.create(artist: el_anatsui, city: anyako)
ArtistCity.create(artist: el_anatsui, city: nsukka)
ArtistCity.create(artist: yayoi_kusama, city: tokyo)

# create exhibition_artists
ExhibitionArtist.create(exhibition: out_of_earth, artist: bill_lynch)
ExhibitionArtist.create(exhibition: out_of_earth, artist: ellen_siebers)
ExhibitionArtist.create(exhibition: infinity_mirror, artist: yayoi_kusama)
ExhibitionArtist.create(exhibition: behind_the_red_moon, artist: el_anatsui)
ExhibitionArtist.create(exhibition: sea_and_space, artist: mary_weatherford)

# create gallery_exhibition
GalleryExhibition.create(gallery: tate, exhibition: behind_the_red_moon)
GalleryExhibition.create(gallery: tate, exhibition: infinity_mirror)
GalleryExhibition.create(gallery: approach, exhibition: out_of_earth)
GalleryExhibition.create(gallery: gagosian, exhibition: sea_and_space)

# create gallery_artists
GalleryArtist.create(gallery: tate, artist: el_anatsui)
GalleryArtist.create(gallery: tate, artist: yayoi_kusama)
GalleryArtist.create(gallery: approach, artist: bill_lynch)
GalleryArtist.create(gallery: approach, artist: ellen_siebers)
GalleryArtist.create(gallery: gagosian, artist: mary_weatherford)

# create opening times
OpeningTime.create(gallery: tate, day_of_week: 0, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 2, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 3, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 4, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 5, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 1, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: tate, day_of_week: 6, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 0)
OpeningTime.create(gallery: gagosian, day_of_week: 1, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 2, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 3, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 4, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 5, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: gagosian, day_of_week: 6, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 0)
OpeningTime.create(gallery: approach, day_of_week: 1, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 2, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 3, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 4, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 5, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: approach, day_of_week: 6)

puts 'Seed data has been successfully added.'