class CreateGalleries < ActiveRecord::Migration[7.1]
    def change
      create_table :galleries do |t|
        t.string :name
        t.string :address_line_1
        t.string :address_line_2
        t.string :address_line_3
        t.string :town
        t.string :postcode
  
        t.timestamps
      end
    end
  end