class CreateArtistCities < ActiveRecord::Migration[7.1]
    def change
      create_table :artist_cities do |t|
        t.references :artist
        t.references :city
        t.integer :period
  
        t.timestamps
      end
    end
  end