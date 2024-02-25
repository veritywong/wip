class CreateCountries < ActiveRecord::Migration[7.1]
    def change
        create_table :countries do |t|
        t.string :name
        t.string :country_code
        t.references :placeable, polymorphic: true

        t.timestamps
        end
    end
end

