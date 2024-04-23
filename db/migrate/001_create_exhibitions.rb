class CreateExhibitions < ActiveRecord::Migration[7.1]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.text :overview
      t.string :url
      t.boolean :visited, default: false

      t.timestamps
    end
  end
end