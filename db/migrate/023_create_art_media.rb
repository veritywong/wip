class CreateArtMedia < ActiveRecord::Migration[7.1]
    def change
      create_table :art_media do |t|
        t.string :name
  
        t.timestamps
      end
   
      create_table :art_medium_entries do |t|
        t.references :art_medium
        t.references :art_mediumable, polymorphic: true

        t.timestamps
      end
    end
end