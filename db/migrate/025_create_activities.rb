class CreateActivities < ActiveRecord::Migration[7.1]
    def change
        create_table :activities do |t|
            t.integer :gallery_exhibition_id
            t.string :name
            t.text :note
            t.datetime :scheduled_at
            t.datetime :completed_at

            t.timestamps
        end
    end
end