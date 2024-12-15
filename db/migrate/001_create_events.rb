class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.integer :gallery_id
      t.string :title
      t.text :overview
      t.string :url
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end