class CreateCollectionArtists < ActiveRecord::Migration[7.1]
    def change
        create_table :collection_artists do |t|
            t.integer :collection_id
            t.integer :artist_id
    
            t.timestamps
        end
    end
end