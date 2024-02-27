class CreateExhibitions < ActiveRecord::Migration[7.1]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end