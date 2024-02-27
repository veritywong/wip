# This file should ensure the existence of records required to run the application in every environment (production,museum1
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create exhibitions
exhibition1 = Exhibition.create(title: 'Out of Earth')
exhibition2 = Exhibition.create(title: 'Infinity Mirror Rooms')
exhibition3 = Exhibition.create(title: 'Behind the Red Moon')
exhibition4 = Exhibition.create(title: 'Sea and Space')

# Create countries
country1  = Country.create(name: 'England', country_code: 'en')
country2 = Country.create(name: 'United States of America', country_code: 'us')
country3 = Country.create(name: 'Ghana', country_code: 'gh')
country4 = Country.create(name: 'Japan', country_code: 'jp')
country5 = Country.create(name: 'Nigeria', country_code: 'ng')

# Create cities
city1 = City.create(name: 'London', country_id: 1)
city2 = City.create(name: 'New York', country_id: 2)
city3 = City.create(name: 'Los Angeles', country_id: 2)
city4 = City.create(name: 'Hudson', country_id: 2)
city5 = City.create(name: 'Anyako', country_id: 3)
city6 = City.create(name: 'Nsukka', country_id: 5)
city7 = City.create(name: 'Tokyo', country_id: 4)

# Create galleries
#museums
museum1 = Museum.create(city_id: 1, name: 'Tate Modern')
museum2 = Museum.create(city_id: 2, name: 'Gagosian')
commercial_space1 = CommercialSpace.create(city_id: 1, name: 'The Approach')

# create artists
artist1 = Artist.create(name: 'Bill Lynch', description: 'Influenced by chinese brush painting, painted on found wood.')
artist2 = Artist.create(name: 'Ellen Siebers', description: 'exhibited with bill lynch.')
artist3 = Artist.create(name: 'Mary Weatherford', description: 'has a show on at the gagosian.')
artist4 = Artist.create(name: 'El Anatsui', description: 'More of a weaver as well')
artist5 = Artist.create(name: 'Yayoi Kusama', description: 'Creates installations with sculptures')

# create artist_countries
ArtistCity.create(artist: artist1, city: city2)
ArtistCity.create(artist: artist2, city: city4)
ArtistCity.create(artist: artist3, city: city3)
ArtistCity.create(artist: artist4, city: city5)
ArtistCity.create(artist: artist4, city: city6)
ArtistCity.create(artist: artist5, city: city7)

# create exhibition_artists
ExhibitionArtist.create(exhibition: exhibition1, artist: artist1)
ExhibitionArtist.create(exhibition: exhibition1, artist: artist2)
ExhibitionArtist.create(exhibition: exhibition2, artist: artist5)
ExhibitionArtist.create(exhibition: exhibition3, artist: artist4)
ExhibitionArtist.create(exhibition: exhibition4, artist: artist3)

# create gallery_exhibition
GalleryExhibition.create(gallery: museum1, exhibition: exhibition3)
GalleryExhibition.create(gallery: museum1, exhibition: exhibition2)
GalleryExhibition.create(gallery: commercial_space1, exhibition: exhibition1)
GalleryExhibition.create(gallery: museum2, exhibition: exhibition4)

# create gallery_artists
GalleryArtist.create(gallery: museum1, artist: artist4)
GalleryArtist.create(gallery: museum1, artist: artist5)
GalleryArtist.create(gallery: commercial_space1, artist: artist1)
GalleryArtist.create(gallery: commercial_space1, artist: artist2)
GalleryArtist.create(gallery: museum2, artist: artist3)

# create opening times
OpeningTime.create(gallery: museum1, day_of_week: 0, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 1, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 2, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 3, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 4, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 5, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum1, day_of_week: 6, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 0)
OpeningTime.create(gallery: museum2, day_of_week: 1, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 2, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 3, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 4, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 5, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: museum2, day_of_week: 6, opens_at: '10:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 0)
OpeningTime.create(gallery: commercial_space1, day_of_week: 1, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 2, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 3, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 4, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 5, opens_at: '12:00', closes_at: '18:00')
OpeningTime.create(gallery: commercial_space1, day_of_week: 6)

puts 'Seed data has been successfully added.'