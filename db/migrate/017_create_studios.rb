class CreateStudios < ActiveRecord::Migration[7.1]
    def change
      create_table :studios do |t|
        t.integer :organisation_id
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