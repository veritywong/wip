class CreateInstallations < ActiveRecord::Migration[7.1]
    def change
      create_table :installations do |t|
        t.string :title
        t.text :description
        t.string :date_of_creation
  
        t.timestamps
      end
    end
  end