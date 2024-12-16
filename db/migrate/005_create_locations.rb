class CreateLocations < ActiveRecord::Migration[7.1]
    def change
        create_table :locations do |t|
          t.integer :city_id
          t.integer :organisation_id
          t.integer :studio_id
          t.string :name
          t.string :website
          t.string :address_line_1
          t.string :address_line_2
          t.string :address_line_3
          t.string :postcode
  
          t.timestamps
        end
    end
end