class CreateExhibitionCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :exhibition_countries do |t|
      t.references :exhibition
      t.references :country

      t.timestamps
    end
  end
end