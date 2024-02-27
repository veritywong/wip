class CreateSculptureParks < ActiveRecord::Migration[7.1]
    def change
        create_table :sculpture_parks do |t|
          t.integer :city_id
          t.string :name
          t.string :address_line_1
          t.string :address_line_2
          t.string :address_line_3
          t.string :postcode
  
          t.timestamps
        end
      end
end