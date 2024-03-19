class CreateArtistMovements < ActiveRecord::Migration[7.1]
    def change
        create_table :artist_movements do |t|
            t.references :movement
            t.references :artist
        end
    end
end