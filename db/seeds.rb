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
five_ways = Exhibition.create(title: 'Zadie Xa: House Gods, Animal Guides and Five Ways 2 Forgiveness', visited: true)

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
tate = Gallery.create(city: london, type: 'Museum', name: 'Tate Modern') 
gagosian = Gallery.create(city: new_york, type: 'Museum', name: 'Gagosian') 
approach = Gallery.create(city: london, type: 'CommercialGallery', name: 'The Approach') 
whitechapel = Gallery.create(city: london, type: 'PublicGallery', name: 'Whitechapel Gallery') 

# create artists
bill_lynch = Artist.create(name: 'Bill Lynch', about: 'Influenced by chinese brush painting, painted on found wood.')
ellen_siebers = Artist.create(name: 'Ellen Siebers', about: 'exhibited with bill lynch.')
mary_weatherford = Artist.create(name: 'Mary Weatherford', about: 'has a show on at the gagosian.')
el_anatsui = Artist.create(name: 'El Anatsui', about: 'More of a weaver as well')
yayoi_kusama = Artist.create(name: 'Yayoi Kusama', about: 'Creates installations with sculptures')
zadie_xa = Artist.create(name: 'Zadie Xa', about: 'Her practice focuses on familial legacies, interspecies communication and diasporic worlding.')

# create installations
chandalier_of_grief = Installation.create(title: 'Chandelier of Grief', date_of_creation: '2016')
infinity_mirrored_room = Installation.create(title: 'Infinity Mirrored Room – Filled with the Brilliance of Life', date_of_creation: '2011')
red_moon = Installation.create(title: 'Behind the Red Moon', date_of_creation: '2023')

# create paintings 
branch_leaves = Painting.create(title: 'No title [Branch, Leaves in Center of Painting]', date_of_creation: '1990-2005', support: 'salvage wood')
redons_poppy = Painting.create(title: "Redon's poppy", date_of_creation: '2023', support: 'birch panel')
celadon_anemone = Painting.create(title: 'Celadon Anemone', date_of_creation: '2023', support: 'linen')

#create art work
art_work1 = ArtWork.create(art: chandalier_of_grief, artist: yayoi_kusama) 
art_work2 = ArtWork.create(art: infinity_mirrored_room, artist: yayoi_kusama) 
art_work3 = ArtWork.create(art: red_moon, artist: el_anatsui) 
art_work4 = ArtWork.create(art: branch_leaves, artist: bill_lynch) 
art_work5 = ArtWork.create(art: redons_poppy, artist: ellen_siebers) 
art_work6 = ArtWork.create(art: celadon_anemone, artist: mary_weatherford) 

painting_inspo = Tag.create(name: 'painting_inspo')
sculpture_inspo = Tag.create(name: 'sculpture_inspo')
recycled_material = Tag.create(name: 'recycled_material')
migration = Tag.create(name: 'migration')

oil_paint = ArtMedium.create(name: 'oil paint')
watercolour_paint = ArtMedium.create(name: 'watercolour paint')
chandelier = ArtMedium.create(name: 'chandelier')
mirrored_glass = ArtMedium.create(name: 'mirrored glass')
steel = ArtMedium.create(name: 'steel')
acrylic = ArtMedium.create(name: 'acrylic')
motor = ArtMedium.create(name: 'motor')
plastic = ArtMedium.create(name: 'plastic')
steel = ArtMedium.create(name: 'steel')
wood = ArtMedium.create(name: 'wood')
aluminium = ArtMedium.create(name: 'aluminium')
ceramic = ArtMedium.create(name: 'ceramic')
leds = ArtMedium.create(name: 'leds')
flashe = ArtMedium.create(name: 'flashe')
bottle_tops = ArtMedium.create(name: 'bottle tops')
copper_wire = ArtMedium.create(name: 'copper wire')

ArtMediumEntry.create(art_medium: oil_paint, art_mediumable: branch_leaves)
ArtMediumEntry.create(art_medium: flashe, art_mediumable: celadon_anemone)
ArtMediumEntry.create(art_medium: chandelier, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: steel, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: mirrored_glass, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: acrylic, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: motor, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: plastic, art_mediumable: chandalier_of_grief)
ArtMediumEntry.create(art_medium: mirrored_glass, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: wood, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: aluminium, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: plastic, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: ceramic, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: leds, art_mediumable: infinity_mirrored_room)
ArtMediumEntry.create(art_medium: bottle_tops, art_mediumable: red_moon)
ArtMediumEntry.create(art_medium: copper_wire, art_mediumable: red_moon)

Tagging.create(tag: painting_inspo, taggable: art_work1)
Tagging.create(tag: sculpture_inspo, taggable: art_work1)
Tagging.create(tag: recycled_material, taggable: art_work3)
Tagging.create(tag: migration, taggable: art_work3)

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
ArtistCity.create(artist: zadie_xa, city: london)

# create exhibition_artists
ExhibitionArtist.create(exhibition: out_of_earth, artist: bill_lynch)
ExhibitionArtist.create(exhibition: out_of_earth, artist: ellen_siebers)
ExhibitionArtist.create(exhibition: infinity_mirror, artist: yayoi_kusama)
ExhibitionArtist.create(exhibition: behind_the_red_moon, artist: el_anatsui)
ExhibitionArtist.create(exhibition: sea_and_space, artist: mary_weatherford)
ExhibitionArtist.create(exhibition: five_ways, artist: zadie_xa)

# create gallery_exhibition
GalleryExhibition.create(gallery: tate, exhibition: behind_the_red_moon)
GalleryExhibition.create(gallery: tate, exhibition: infinity_mirror)
GalleryExhibition.create(gallery: approach, exhibition: out_of_earth)
GalleryExhibition.create(gallery: gagosian, exhibition: sea_and_space)
five_ways_whitechapel = GalleryExhibition.create(gallery: whitechapel, exhibition: five_ways)

# create activities
Activity.create(gallery_exhibition: five_ways_whitechapel, name: 'whitechapel gallery visit', completed_at: 'April 09, 2023')
Activity.create(name: 'walk in epping forest', completed_at: 'June 09, 2023' )

# create collections
one = Collection.create(title: 'Art day out ideas')

# create items
item_one = Item.create(collection: one, content: 'visit V&A ceramics collection')
item_two = Item.create(collection: one, content: 'go drawing and walking in epping forest')
item_three =  Item.create(collection: one, content: 'Chelsea Physic garden take photos')
item_four = Item.create(collection: one, content: 'Kew garden take photos')

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