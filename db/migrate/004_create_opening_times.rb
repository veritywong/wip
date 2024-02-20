class CreateOpeningTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :opening_times do |t|
      t.integer :gallery_id
      t.integer :day_of_week
      t.time :opens_at
      t.time :closes_at

      t.timestamps
    end
  end
end