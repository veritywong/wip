class CreateExhibitionArtWorks < ActiveRecord::Migration[7.1]
    def change
      create_table :exhibition_art_works do |t|
        t.references :exhibition
        t.references :art_work

        t.timestamps
      end
    end
  end