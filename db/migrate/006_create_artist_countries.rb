class CreateArtistCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_countries do |t|
      t.references :artist
      t.references :country

      t.timestamps
    end
  end
end