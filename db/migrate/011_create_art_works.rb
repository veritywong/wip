class CreateArtWorks < ActiveRecord::Migration[7.1]
    def change
      create_table :art_works do |t|
        t.references :artist
        t.references :art, polymorphic: true
  
        t.timestamps
      end
    end
  end