class CreateArtists < ActiveRecord::Migration[7.1]
    def change
        create_table :artists do |t|
        t.string :name
        t.text :description
        t.string :website
        t.string :instagram

        t.timestamps
        end
    end
end