class CreateLocationArtists < ActiveRecord::Migration[7.1]
    def change
      create_table :location_artists do |t|
        t.references :location
        t.references :artist
  
        t.timestamps
      end
    end
  end