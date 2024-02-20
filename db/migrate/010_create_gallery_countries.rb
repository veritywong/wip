class CreateGalleryCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_countries do |t|
      t.references :gallery
      t.references :country

      t.timestamps
    end
  end
end