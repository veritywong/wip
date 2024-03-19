class CreateCollections < ActiveRecord::Migration[7.1]
    create_table :collections do |t|
        t.string :name
        t.text :description
        t.text :note
        
        t.timestamps
    end
end