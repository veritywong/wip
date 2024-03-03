class CreatePaintings < ActiveRecord::Migration[7.1]
    def change
      create_table :paintings do |t|
        t.string :name
        t.text :description
        t.string :date_of_creation
        t.string :style
        t.string :technique
        t.string :medium_1
        t.string :medium_2
        t.string :medium_3
        t.string :support
  
        t.timestamps
      end
    end
  end