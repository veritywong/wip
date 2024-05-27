class CreateGalleryExhibitions < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_exhibitions do |t|
      t.references :gallery
      t.references :exhibition
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end