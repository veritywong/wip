class CreateEvents < ActiveRecord::Migration[7.1]
    def change
        create_table :events do |t|
            t.integer :exhibition_id
            t.string :name
            t.text :description
            t.text :note
            t.datetime :scheduled_at
            t.datetime :completed_at

            t.timestamps
        end
    end
end