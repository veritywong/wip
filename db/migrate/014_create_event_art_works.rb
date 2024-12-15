class CreateEventArtWorks < ActiveRecord::Migration[7.1]
    def change
      create_table :event_art_works do |t|
        t.references :event
        t.references :art_work

        t.timestamps
      end
    end
  end