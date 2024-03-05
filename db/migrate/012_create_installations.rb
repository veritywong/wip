class CreateInstallations < ActiveRecord::Migration[7.1]
    def change
      create_table :installations do |t|
        t.string :title
        t.text :description
        t.string :date_of_creation
        t.string :medium_1
        t.string :medium_2
        t.string :medium_3
        t.string :medium_4
        t.string :medium_5
        t.string :medium_6
        t.string :medium_7
  
        t.timestamps
      end
    end
  end