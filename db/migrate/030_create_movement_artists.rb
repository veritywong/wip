class CreateMovementArtists < ActiveRecord::Migration[7.1]
    create_table :movement_artists do |t|
        t.references :movement
        t.references :artist
    end
end