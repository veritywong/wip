class CreateArtists < ActiveRecord::Migration[7.1]
    def change
        create_table :artists do |t|
            t.integer :studio_id
            t.string :name
            t.string :website
            t.string :instagram
            t.text :description

            t.timestamps
        end
    end
end