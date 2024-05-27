class CreateOrganisations < ActiveRecord::Migration[7.1]
    def change
      create_table :organisations do |t|
        t.integer :city_id
        t.string :name
  
        t.timestamps
      end
    end
  end