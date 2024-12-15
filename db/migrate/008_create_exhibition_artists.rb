class CreateEventArtists < ActiveRecord::Migration[7.1]
    def change
      create_table :event_artists do |t|
        t.references :event
        t.references :artist
  
        t.timestamps
      end
    end
  end