class CreateCities < ActiveRecord::Migration[7.1]
    def change
      create_table :cities do |t|
        t.integer :country_id
        t.string :name
  
        t.timestamps
      end
    end
  end