class CreateGalleryArtists < ActiveRecord::Migration[7.1]
    def change
      create_table :gallery_artists do |t|
        t.references :gallery
        t.references :artist
  
        t.timestamps
      end
    end
  end