class CreatePaintings < ActiveRecord::Migration[7.1]
    def change
      create_table :paintings do |t|
        t.string :title
        t.text :description # info?, description_of_work? label?
        t.string :date_of_creation
        t.string :style
        t.string :technique
        t.string :support
  
        t.timestamps
      end
    end
  end