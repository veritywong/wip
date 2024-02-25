class CreateGalleryExhibitions < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_exhibitions do |t|
      t.references :gallery
      t.references :exhibition

      t.timestamps
    end
  end
end