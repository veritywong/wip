class CreateExhibitionArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :exhibition_artists do |t|
      t.references :exhibition
      t.references :artist

      t.timestamps
    end
  end
end