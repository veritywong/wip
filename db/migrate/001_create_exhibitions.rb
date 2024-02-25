class CreateExhibitions < ActiveRecord::Migration[7.1]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :gallery_name
      t.text :description
      t.string :url
      t.string :image_url
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end